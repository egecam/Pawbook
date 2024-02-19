//
//  RegisterNewCatView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit
import SwiftData

struct RegisterNewCatView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var mapViewModel = MapViewModel()
    
    @State var name: String = ""
    @State var breed: String = ""
    @State var age: Double = 0
    @State var bio: String = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            Button {
                // TODO: action to select or capture images
            } label: {
                ZStack {
                    Color.gray
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .opacity(0.25)
                        .frame(width: 360, height: 360)
                    Label("ADD_IMG_BUTTON", systemImage: "plus.square")
                        .labelStyle(.titleAndIcon)
                        .foregroundStyle(.secondary)
                }
            }
            .safeAreaPadding()
            
            VStack {
                Text("BASIC_INFO_TITLE")
                    .bold()
                    .font(.title)
                Label("BASIC_INFO_DESC", systemImage: "person.text.rectangle.fill")
                    .font(.caption)
                
                TextField(
                    "NAME_INPUT",
                    text: $name
                )
                .multilineTextAlignment(.center)
                .bold()
                .font(.title)
                
                
                Spacer()
                TextField(
                    "BREED_INPUT",
                    text: $breed
                )
                .multilineTextAlignment(.center)
                .font(.title2)
                
                Spacer()
                TextField(
                    "AGE_INPUT",
                    value: $age,
                    formatter: amountFormatter
                )
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .font(.title3)
                
            }
            .padding()
            
            VStack {
                Text("CAT_BIO_TITLE")
                    .font(.title2)
                    .bold()
                Label("CAT_BIO_DESC", systemImage: "book")
                    .font(.caption)
                TextField(
                    "CAT_BIO_PH",
                    text: $bio
                )
                .multilineTextAlignment(.center)
                // TODO: auto multiline
                .padding()
            }
            .padding()
            
            // TODO: add putting a pin on map feature
            
            VStack {
                VStack {
                    Text("NEIGHBORHOOD_TITLE")
                        .font(.title2)
                        .bold()
                    Label("NEIGHBORHOOD_DESC", systemImage: "mappin.and.ellipse")
                        .font(.caption)
                    
                }
                
                Map(position: $mapViewModel.cameraPosition) {
                    
                }
                .mapControls{
                    MapUserLocationButton()
                }
                .frame(width: 360, height: 360)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .safeAreaPadding()
                .tint(.orange)
                
            }
            
            HStack {
                Button {
                    // TODO: action to cancel
                } label: {
                    ZStack {
                        Color.red
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(0.2)
                        Text("CANCEL_BUTTON")
                            .foregroundStyle(.red.secondary)
                            .font(.title3)
                            .padding()
                    }
                }
                .padding()
                
                Button {
                    let newCat = Cat(name: name, breed: breed, age: age, neighborhood: "", location: Coordinate2D(latitude: 42, longitude: 29), thumbnailImage: "")
                    modelContext.insert(newCat)
                } label: {
                    ZStack {
                        Color.green
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(0.35)
                        Text("SAVE_BUTTON")
                            .foregroundStyle(.green)
                            .bold()
                            .font(.title3)
                            .padding()
                    }
                }
                .padding()
                
            }
            
        }
    }
    
    let amountFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
}



#Preview {
    RegisterNewCatView()
}
