//
//  User.swift
//  Pawbook
//
//  Created by Ege Çam on 16.02.2024.
//

import Foundation
import SwiftData

@Model
final class User {
    var id = UUID()
    var username: String
    var email: String
    var password: String
    var bio: String
    var profilePicture: String
    var registeredCats: [Cat]?
    
    init(id: UUID = UUID(), username: String, email: String, password: String, bio: String, profilePicture: String, registeredCats: [Cat]? = nil) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.bio = bio
        self.profilePicture = profilePicture
        self.registeredCats = registeredCats
    }
}
