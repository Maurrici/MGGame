//
//  DecodeService.swift
//  MGGame
//
//  Created by Mauricio on 02/12/23.
//

import Foundation

struct MessageDecode {
    var type: String
    var data: [String: Any]
}

struct DecodeService {
    static func decodeGenericResponse(jsonData: Data) -> MessageDecode? {
        do {
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
               let type = json["type"] as? String,
               let data = json["data"] as? [String: Any] {

                return MessageDecode(type: type, data: data)
            }
        } catch {
            print("Erro ao decodificar JSON bruto:", error)
        }
        
        return nil
    }
}
