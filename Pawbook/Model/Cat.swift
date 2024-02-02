//
//  Cat.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import Foundation
import CoreLocation

struct CatModel {
    var name: String
    var breed: String
    var age: Double
    var neighborhood: String
    var coordinate: CLLocationCoordinate2D?
    var thumbnailImage: String
}
