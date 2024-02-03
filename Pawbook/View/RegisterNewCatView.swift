//
//  RegisterNewCatView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit

struct RegisterNewCatView: View {
    @State private var name: String = ""
    @State private var breed: String = ""
    @State private var age: String = ""
    
    let startPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ))
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField(
                    "Name",
                    text: $name
                )
                .font(.largeTitle)
                .foregroundStyle(Color.black)
                .bold()
            }
            
            HStack {
                Spacer()
                TextField(
                    "Breed",
                    text: $breed
                )
                .font(.title2)
                .foregroundStyle(Color.black)
                .bold()
            }
            
            HStack {
                Spacer()
                TextField(
                    "Age",
                    text: $age
                )
                .font(.title2)
                .foregroundStyle(Color.black)
                .bold()
            }
            
            // TODO: get user current location
            // TODO: set initialPosition to user location
            // TODO: add putting a pin on map feature
             
            Map(initialPosition: startPosition) {
                
            }
            .frame(width: 350, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
        }
        .padding()
        
    }
}

#Preview {
    RegisterNewCatView()
}
