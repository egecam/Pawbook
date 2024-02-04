//
//  Cardview.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var catViewModel: CatViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .opacity(0.4)
                .cornerRadius(12.0)
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("\(catViewModel.catNeighborhood)")
                            .foregroundStyle(Color.secondary)
                            .bold()
                            .font(.title3)
                    }
                    .padding()
                }
                
                Spacer()
                AsyncImage(url: URL(string: catViewModel.thumbnailImage)) { image in
                    image.image?.resizable()
                }
                .frame(width: 270, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                ZStack {
                    
                    VStack {
                        HStack {
                            Text("\(catViewModel.catName),")
                                .bold()
                                .font(.largeTitle)
                            Text("\(catViewModel.catBreed)")
                                .font(.title)
                        }
                        Text("\(catViewModel.catAge.formatted()) years")
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
    CardView(catViewModel: CatViewModel(catModel: CatModel(name: "Arwen", breed: "Tabby", age: 2.0, neighborhood: "Moda", thumbnailImage: "https://cdn2.thecatapi.com/images/dj5.jpg")))
}
