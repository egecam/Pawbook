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
    
    init(name: String, breed: String, age: Double, neighborhood: String, location: Coordinate2D, thumbnailImage: String) {
        self.name = name
        self.breed = breed
        self.age = age
        self.neighborhood = neighborhood
        self.location = location
        self.thumbnailImage = thumbnailImage
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
