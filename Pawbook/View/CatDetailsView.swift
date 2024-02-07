//
//  CatDetailsView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit
import SwiftData

extension CLLocationCoordinate2D {
    static let catCoordinate = CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696)
}

struct CatDetailsView: View {
    @StateObject private var mapViewModel = MapViewModel()
    
    @Bindable var cat: Cat
    
    @State private var catCoordinates = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/GAmy2bg8G.jpg")) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                        
                        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/GAmy2bg8G.jpg")) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                        
                        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/LSaDk6OjY.jpg")) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                    }
                }
                
                HStack {
                    Text($cat.name.wrappedValue)
                        .font(.largeTitle)
                        .bold()
                    Text("from")
                        .font(.largeTitle)
                    Text($cat.neighborhood.wrappedValue)
                        .font(.largeTitle)
                        .bold()
                }
            }
            
            Text("\($cat.name.wrappedValue) is \($cat.age.wrappedValue.formatted()) years old.")
                .font(.headline)
            Text("He is a literal orange. He loves to spy on his human and do some other silly things that every cat does on a daily basis.")
                .padding()
            
            Map {
                Marker("\($cat.name.wrappedValue)", systemImage: "cat.circle.fill", coordinate: cat.location.location)
                MapCircle(center: .catCoordinate, radius: CLLocationDistance(50))
                    .foregroundStyle(.orange.opacity(0.5))
                    .mapOverlayLevel(level: .aboveLabels)
            }
            .frame(width: 360, height: 360)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .tint(.orange)
        }
        .task {
            mapViewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

#Preview {
    CatDetailsView(cat: Cat(name: "Zeus", breed: "Tabby", age: 12, neighborhood: "Altayçeşme", location: Coordinate2D(latitude: 41, longitude: 28), thumbnailImage: ""))
}
