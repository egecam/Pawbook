//
//  Cat.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import Foundation
import CoreLocation
import SwiftData

struct Coordinate2D: Codable {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

@Model
final class Cat {
    var id = UUID()
    var name: String
    var breed: String
    var age: Double
    var neighborhood: String
    var location: Coordinate2D
    var thumbnailImage: String
    var bio: String
    var registeredBy: User
    var verifiedBy: [User]?
    
    init(name: String, breed: String, age: Double, neighborhood: String, location: Coordinate2D, thumbnailImage: String, bio: String, registeredBy: User, verifiedBy: [User]? = nil) {
        self.name = name
        self.breed = breed
        self.age = age
        self.neighborhood = neighborhood
        self.location = location
        self.thumbnailImage = thumbnailImage
        self.bio = bio
        self.registeredBy = registeredBy
        self.verifiedBy = verifiedBy
    }
}


extension Coordinate2D {
    init(_ location: CLLocationCoordinate2D) {
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
