//
//  Cardview.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import SwiftData

struct CardView: View {
    @Bindable var cat: Cat
    
    var body: some View {
        ZStack {
            Color.green
                .opacity(0.4)
                .cornerRadius(12.0)
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Label($cat.neighborhood.wrappedValue, systemImage: "mappin.and.ellipse")
                            .foregroundStyle(Color.secondary)
                            .bold()
                            .font(.title3)
                        
                    }
                    .padding()
                }
                
                Spacer()
                AsyncImage(url: URL(string: "")) { image in
                    image.image?.resizable()
                }
                .frame(width: 270, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                ZStack {
                    
                    VStack {
                        HStack {
                            Text("\($cat.name.wrappedValue),")
                                .bold()
                                .font(.largeTitle)
                            Text("\($cat.breed.wrappedValue)")
                                .font(.title)
                        }
                        Text("\($cat.age.wrappedValue.formatted()) YEARS_TEXT_CAT_AGE")
                            .foregroundStyle(Color.secondary)
                            .bold()
                            .font(.title3)
                    }
                    .padding()
                }
            }
            .padding()
            
        }
        .frame(width: 370, height: 470)
        .cornerRadius(12.0)
    }
}

#Preview {
    CardView(cat: Cat(name: "Arwen", breed: "Tabby", age: 2.0, neighborhood: "Moda", location: Coordinate2D(latitude: 41.032, longitude: 28.984), thumbnailImage: "https://cdn2.thecatapi.com/images/dj5.jpg"))
}
