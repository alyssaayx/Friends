//
//  Friend.swift
//  Friends
//
//  Created by rgs on 26/6/21.
//

import Foundation

struct Friend: Identifiable, Equatable, Codable {
    
    var id = UUID()
    
    var name: String
    var icon: String
    var school: String
    
    var slothImage: String
    
    var attack: Double
    var defense: Double
    
    var types: [FriendType]
}
