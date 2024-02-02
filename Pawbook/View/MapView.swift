//
//  MapView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map {
            Marker("Arwen", coordinate: .catCoordinate)
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    MapView()
}
