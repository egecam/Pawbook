//
//  ContentView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit
import SwiftData

struct Home: View {
    @Query private var cats: [Cat]
    
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "pawprint.fill")
                Text("Pawbook")
                Spacer()
            }
            .font(.largeTitle)
            .bold()
            .padding()
            
            Spacer()
            
            NavigationLink(destination: RegisterNewCatView(), label: {
                ButtonWithImageView(title: "Register a paw", image: "plus.square.dashed", color: .orange)
                    .onAppear {
                        mapViewModel.checkIfLocationServicesIsEnabled()
                    }
            })
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Registered Paws")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cats) { cat in
                            NavigationLink(destination: CatDetailsView(cat: cat)) {
                                CardView(cat: cat)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .tint(.black)
    }
}

#Preview {
    Home()
}
