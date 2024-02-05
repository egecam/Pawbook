//
//  RegisterNewCatView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit

struct RegisterNewCatView: View {
    @StateObject private var mapViewModel = MapViewModel()
    
    @State private var name: String = ""
    @State private var breed: String = ""
    @State private var age: String = ""
    @State private var desc: String = ""
    
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
                    Label("Add Images", systemImage: "plus.square")
                        .labelStyle(.titleAndIcon)
                        .foregroundStyle(.secondary)
                }
            }
            .safeAreaPadding()
            
            VStack {
                Text("Basic Information")
                    .bold()
                    .font(.title)
                Label("What are their name, breed and age?", systemImage: "person.text.rectangle.fill")
                    .font(.caption)
                
                TextField(
                    "Name",
                    text: $name
                )
                .multilineTextAlignment(.center)
                .bold()
                .font(.title)
                
                
                Spacer()
                TextField(
                    "Breed",
                    text: $breed
                )
                .multilineTextAlignment(.center)
                .font(.title2)
                
                Spacer()
                TextField(
                    "Age",
                    text: $age
                )
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .font(.title3)
                
            }
            .padding()
            
            VStack {
                Text("Tell us a bit about the cat!")
                    .font(.title2)
                    .bold()
                Label("What do they like? How to they act?", systemImage: "book")
                    .font(.caption)
                TextField(
                    "A silly orange cat...",
                    text: $desc
                )
                .multilineTextAlignment(.center)
                // TODO: auto multiline
                .padding()
            }
            .padding()
            
            // TODO: set initialPosition to user location
            // TODO: add putting a pin on map feature
            
            VStack {
                VStack {
                    Text("Neighborhood")
                        .font(.title2)
                        .bold()
                    Label("Where do they hang around approximately?", systemImage: "mappin.and.ellipse")
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
                        Text("Cancel")
                            .foregroundStyle(.red.secondary)
                            .font(.title3)
                            .padding()
                    }
                }
                .padding()
                
                Button {
                    // TODO: action to save
                } label: {
                    ZStack {
                        Color.green
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(0.35)
                        Text("Save")
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
}

#Preview {
    RegisterNewCatView()
}

