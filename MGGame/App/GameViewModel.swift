//
//  GameViewModel.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var player: PlayerModel
    @Published var rooms: [RoomModel] = []
    @Published var myRoom: RoomModel? {
        didSet {
            if myRoom != nil { isInRoom = true }
            else { isInRoom = false }
        }
    }
    @Published var isInRoom: Bool = false
    
    var session = GameConnection()
    
    init(userID: UUID, nickName: String) {
        self.player = PlayerModel(id: userID, nickName: nickName, ready: false)
        self.session.handler = self
    }
    
    func getPublicRooms(roomPublic: RoomModel) {
        let isNewRoom = rooms.first { room in room.id == roomPublic.id }
        
        if isNewRoom == nil {
            rooms.append(roomPublic)
        }
    }
    
    func setPlayerStatus() {
        self.player.ready.toggle()
        session.send(message: GenericMessage(type: MessageType.playerReady.rawValue, data: PlayerStatusModel(userId: self.player.id, ready: self.player.ready)))
        self.myRoom?.players = self.myRoom?.players?.map { remotePlayer in
            var updatePlayer = remotePlayer
            if updatePlayer.id == self.player.id {
                updatePlayer.ready = self.player.ready
            }
            return updatePlayer
        }
    }
    
    func getPlayerStatus(playerStatusModel: PlayerStatusModel) {
        self.myRoom?.players = self.myRoom?.players?.map { remotePlayer in
            var updatePlayer = remotePlayer
            if updatePlayer.id == playerStatusModel.userId {
                updatePlayer.ready = playerStatusModel.ready
            }
            return updatePlayer
        }
    }
    
    func createRoom(name: String) {
        let room = RoomModel(id: .init(), name: name, hostID: player.id, players: [player])
        myRoom = room
        
        let message = GenericMessage(type: MessageType.newRoom.rawValue, data: myRoom)
        session.send(message: message)
    }
    
    func joinRoom(room: RoomModel) {
        myRoom = room
        myRoom?.players?.append(player)
        
        let message = GenericMessage(type: MessageType.joinRoom.rawValue, data: RoomJoinPlayer(roomId: room.id, player: player))
        session.send(message: message)
    }
    
    func newPlayerInRoom(roomJoinPlayer: RoomJoinPlayer) {
        if myRoom?.id == roomJoinPlayer.roomId {
            myRoom?.players?.append(roomJoinPlayer.player)
        }
    }
    
    func removePLayerInRoom(roomQuitPlayer: RoomQuitPlayer) {
        if roomQuitPlayer.roomId == myRoom?.id {
            if roomQuitPlayer.playerId == myRoom?.hostID {
                myRoom = nil
                self.rooms = rooms.filter({ room in room.id != roomQuitPlayer.roomId})
                return
            } else {
                self.myRoom?.players = myRoom?.players?.filter({ player in player.id != roomQuitPlayer.playerId})
            }
        }
        
        self.rooms = rooms.filter({ room in room.hostID != roomQuitPlayer.playerId})
    }
    
    func offerRoom() {
        if myRoom != nil {
            let message = GenericMessage(type: MessageType.newRoom.rawValue, data: myRoom)
            session.send(message: message)
        }
    }
    
    func quitRoom() {
        if let roomId = myRoom?.id {
            myRoom = nil
            let roomQuitPlayer = RoomQuitPlayer(roomId: roomId, playerId: player.id)
            let message = GenericMessage(type: MessageType.quitRoom.rawValue, data: roomQuitPlayer)
            
            session.send(message: message)
        }
    }
}
