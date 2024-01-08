//
//  KeyService.swift
//  MGGame
//
//  Created by Gustavo Holzmann on 05/01/24.
//

import Foundation

class KeysService {
    enum Keys: String {
        case username
        case userId
    }
        
    static func get(_ key: KeysService.Keys) -> Any? {
        UserDefaults.standard.value(forKey: key.rawValue)
    }
    
    static func getString(_ key: KeysService.Keys) -> String {
        guard let value = UserDefaults.standard.value(forKey: key.rawValue) as? String else { return ""}
        return value
    }
    
    static func set(_ value: Any?, for key: KeysService.Keys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func has(key: KeysService.Keys) -> Bool {
        UserDefaults.standard.value(forKey: key.rawValue) != nil
    }
}
