//
//  Home.swift
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
        
        if cats.isEmpty {
            
            
            NavigationStack {
                HStack {
                    Label("Pawbook", systemImage: "pawprint.fill")
                        .padding()
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                Spacer()
                
                    VStack {
                        Label("NO_REGISTERED_CATS_TEXT_HOME", systemImage: "cat.fill")
                            .bold()
                            .font(.title3)
                        
                        Label("NO_REGISTERED_CATS_DESC_HOME", systemImage: "")
                            .labelStyle(.titleOnly)
                            .font(.caption)
                    }
                    .padding()
                    
                    NavigationLink(destination: RegisterNewCatView(), label: {
                        ZStack {
                            Color.orange
                                .opacity(0.25)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 250, height: 60)
                            
                            Label("REGISTER_FIRST_PAW_BUTTON", systemImage: "plus.square")
                                .font(.title3)
                                .foregroundStyle(.orange)
                        }
                        .padding()
                        .onAppear {
                            mapViewModel.checkIfLocationServicesIsEnabled()
                        }
                    })
                Spacer()
            }
            
        }
        
        else {
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
                    ZStack {
                        Color.orange
                            .opacity(0.25)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .frame(width: 250, height: 60)
                        
                        Label("REGISTER_A_PAW_BUTTON", systemImage: "plus.square")
                            .font(.title3)
                            .foregroundStyle(.orange)
                    }
                    .onAppear {
                        mapViewModel.checkIfLocationServicesIsEnabled()
                    }
                })
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("REGISTERED_PAWS_TITLE")
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
}

#Preview {
    Home()
}
