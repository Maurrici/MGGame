//
//  GameViewModel.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var player: PlayerModel
    @Published var availableRooms: [RoomModel] = []
    @Published var myRoom: RoomModel?
    @Published var gameHasStarted: Bool = false
    
    var session = GameConnection()
    
    init(userID: UUID, nickName: String) {
        self.player = PlayerModel(id: userID, nickName: nickName, ready: false)
        self.session.handler = self
    }
    
    func getPublicGameRooms(roomPublic: RoomModel) {
        let isNewRoom = availableRooms.first { room in room.id == roomPublic.id }
        
        if isNewRoom == nil {
            availableRooms.append(roomPublic)
        }
    }
    
    func setStoryteller(numberOfPlayers: Int) {
        guard var room = myRoom else {
            return
        }
        
        for index in room.players.indices {
            room.players[index].isStoryteller = false
        }
        
        let randomNumber = Int.random(in: 0 ..< numberOfPlayers)
        room.players[randomNumber].isStoryteller.toggle()
        self.myRoom = room
    }
    
    func initGame() -> Bool {
        
        // TODO: Uncomment conditional for the number of players after testing
        // if myRoom?.players?.count ?? 2 < 3 { return false }

        var startGame = true

        for player in myRoom?.players ?? [] {
            if !player.ready {
                startGame = false
                break  // Exit the loop if any player is not ready
            }
        }

        if startGame {
            self.gameHasStarted = true
        }

        return startGame
    }
    
    func setPlayerStatus() {
        guard var room = myRoom else {
            return
        }
        
        self.player.ready.toggle()
        session.send(message: GenericMessage(type: MessageType.playerReady.rawValue, data: PlayerStatusModel(userId: self.player.id, ready: self.player.ready)))
        room.players = room.players.map { remotePlayer in
            var updatePlayer = remotePlayer
            if updatePlayer.id == self.player.id {
                updatePlayer.ready = self.player.ready
            }
            
            return updatePlayer
        }
        
        myRoom = room
    }
    
    func getPlayerStatus(playerStatusModel: PlayerStatusModel) {
        guard var room = myRoom else {
            return
        }
        
        room.players = room.players.map { remotePlayer in
            var updatePlayer = remotePlayer
            if updatePlayer.id == playerStatusModel.userId {
                updatePlayer.ready = playerStatusModel.ready
            }
            return updatePlayer
        }
        
        myRoom = room
    }
    
    func createRoom(name: String) {
        let room = RoomModel(id: .init(), name: name, hostID: player.id, players: [player])
        myRoom = room
        
        let message = GenericMessage(type: MessageType.newRoom.rawValue, data: myRoom)
        session.send(message: message)
    }
    
    func joinRoom(newRoom: RoomModel) {
        guard var room = myRoom else {
            return
        }

        room = newRoom
        room.players.append(self.player)
        
        let message = GenericMessage(type: MessageType.joinRoom.rawValue, data: RoomJoinPlayer(roomId: room.id, player: player))
        session.send(message: message)
        
        myRoom = room
    }
    
    func joinPlayerInRoom(roomJoinPlayer: RoomJoinPlayer) {
        guard var room = myRoom else {
            return
        }
        if room.id == roomJoinPlayer.roomId {
            room.players.append(roomJoinPlayer.player)
        }

        myRoom = room
    }
    
    func removePLayerInRoom(roomQuitPlayer: RoomQuitPlayer) {
        guard var room = myRoom else {
            return
        }
        
        if roomQuitPlayer.roomId == room.id {
            if roomQuitPlayer.playerId == room.hostID {
                myRoom = nil
                self.availableRooms = availableRooms.filter({ room in room.id != roomQuitPlayer.roomId})
                return
            } else {
                room.players = room.players.filter({ player in player.id != roomQuitPlayer.playerId })
            }
        }
        
        myRoom = room
        self.availableRooms = availableRooms.filter({ room in room.hostID != roomQuitPlayer.playerId})
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
