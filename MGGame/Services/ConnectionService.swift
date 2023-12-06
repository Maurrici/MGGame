//
//  ConnectionService.swift
//  CreativeThinking
//
//  Created by Mauricio on 28/11/23.
//

import MultipeerConnectivity
import os

class GameConnection: NSObject, ObservableObject {
    private let serviceType = "mg-game"
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    private let serviceBrowser: MCNearbyServiceBrowser
    private let session: MCSession
    private let log = Logger()
    
    @Published var connectedPeers: [MCPeerID] = []
    var handler: GameViewModel? = nil
    
    override init() {
        session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .none)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)
        
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
    }
    
    func send<T: Codable>(message: GenericMessage<T>) {
        log.info("sendRoom to \(self.session.connectedPeers.count) peers")
        
        if !session.connectedPeers.isEmpty {
            do{
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                log.error("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func send<T: Codable>(message: GenericMessage<T>, peerID: MCPeerID) {
        log.info("sendRoom to \(peerID)")
        
        if !session.connectedPeers.isEmpty {
            do{
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: [peerID], with: .reliable)
            } catch {
                log.error("Error for sending: \(String(describing: error))")
            }
        }
    }
}

extension GameConnection: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        log.error("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        log.info("didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, session)
    }
}

extension GameConnection: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        log.error("ServiceBrowser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        log.info("ServiceBrowser found peer: \(peerID)")
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        log.info("ServiceBrowser lost peer: \(peerID)")
    }
}

extension GameConnection: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        log.info("peer \(peerID) didChangeState: \(state.rawValue)")
        DispatchQueue.main.async {
            self.connectedPeers = session.connectedPeers
            self.handler?.offerRoom()
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        log.info("didReceive bytes \(data.count) bytes")
        let message = DecodeService.decodeGenericResponse(jsonData: data)
        
        if let type = MessageType(rawValue: message?.type ?? "") {
            switch(type) {
            case .newRoom:
                if let roomData = try? JSONSerialization.data(withJSONObject: message?.data as Any),
                   let room = try? JSONDecoder().decode(RoomModel.self, from: roomData) {
                    DispatchQueue.main.async {
                        self.handler?.getPublicRooms(roomPublic: room)
                    }
                }
            case .joinRoom:
                if let roomJoinPLayerData = try? JSONSerialization.data(withJSONObject: message?.data as Any),
                   let roomJoinPLayer = try? JSONDecoder().decode(RoomJoinPlayer.self, from: roomJoinPLayerData) {
                    DispatchQueue.main.async {
                        self.handler?.newPlayerInRoom(roomJoinPlayer: roomJoinPLayer)
                    }
                }
            case .quitRoom:
                if let roomQuitPLayerData = try? JSONSerialization.data(withJSONObject: message?.data as Any),
                   let roomQuitPLayer = try? JSONDecoder().decode(RoomQuitPlayer.self, from: roomQuitPLayerData) {
                    DispatchQueue.main.async {
                        self.handler?.removePLayerInRoom(roomQuitPlayer: roomQuitPLayer)
                    }
                }
            case .playerReady:
                if let roomPlayerChangedStatusData = try? JSONSerialization.data(withJSONObject: message?.data as Any),
                   let roomPlayerChangedStatus = try? JSONDecoder().decode(PlayerStatusModel.self, from: roomPlayerChangedStatusData) {
                    DispatchQueue.main.async {
                        self.handler?.getPlayerStatus(playerStatusModel: roomPlayerChangedStatus)
                    }
                }
            }
        }
    }
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        log.error("Receiving streams is not supported")
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        log.error("Receiving resources is not supported")
    }
}
