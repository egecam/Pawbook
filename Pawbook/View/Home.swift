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
    @State var isLoggedIn: Bool
    
    @Query private var cats: [Cat]
    
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        if isLoggedIn { // user logged in
            NavigationStack() {
                HStack {
                    Image(systemName: "pawprint.fill")
                    Text("Pawbook")
                    Spacer()
                }
                .font(.largeTitle)
                .bold()
                .padding()
                
                Spacer()
                
                if cats.isEmpty {
                    VStack {
                        Label("NO_REGISTERED_CATS_TEXT_HOME", systemImage: "cat.fill")
                            .font(.title3)
                            .bold()
                        
                        Text("NO_REGISTERED_CATS_DESC_HOME")
                            .font(.caption)
                    }
                    .padding()
                }
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
                if !cats.isEmpty {
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
                
            }
            .tint(.black)
            
        } else { // user is not logged in
            
        }
        
        
    }
}

#Preview {
    Home(isLoggedIn: true)
}
