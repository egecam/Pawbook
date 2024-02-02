//
//  ContentView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var catViewModel1 = CatViewModel(catModel: CatModel(name: "Arwen", breed: "Tabby", age: 1.0, neighborhood: "Cihangir", coordinate: CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696), thumbnailImage: "https://cdn2.thecatapi.com/images/dj5.jpg"))
    @StateObject var catViewModel2 = CatViewModel(catModel: CatModel(name: "Zeus", breed: "Tabby", age: 13.0, neighborhood: "Altayçeşme", coordinate: CLLocationCoordinate2D(latitude: 40.936933012654116, longitude: 29.131188164737058), thumbnailImage: "https://cdn2.thecatapi.com/images/RqIGMF79u.jpg"))
    @StateObject var catViewModel3 = CatViewModel(catModel: CatModel(name: "Simba", breed: "Siamese", age: 4.0, neighborhood: "Moda", coordinate: CLLocationCoordinate2D(latitude: 40.98185491474414, longitude: 29.023143536835203), thumbnailImage: "https://cdn2.thecatapi.com/images/MTU0NzEwOA.jpg"))
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "cat.fill")
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
                    HStack {
                        Image(systemName: "plus.square.dashed")
                            .foregroundStyle(.orange)
                            .font(.title3)
                        Text("Register a paw")
                            .font(.title3)
                            .foregroundStyle(Color.orange)
                    }
                }
            })
            .navigationBarBackButtonHidden(true)
            
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
                        NavigationLink(destination: CatDetailsView(catViewModel: catViewModel1)) {
                            CardView(catViewModel: catViewModel1)
                        }
                        
                        NavigationLink(destination: CatDetailsView(catViewModel: catViewModel2)) {
                            CardView(catViewModel: catViewModel2)
                        }
                        
                        NavigationLink(destination: CatDetailsView(catViewModel: catViewModel3)) {
                            CardView(catViewModel: catViewModel3)
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
    ContentView()
}
