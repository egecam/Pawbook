//
//  RegisterNewCatView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI

struct RegisterNewCatView: View {
    @State private var name: String = ""
    @State private var breed: String = ""
    @State private var age: String = ""
    @State private var neighborhood: String = ""
    
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
            
            // this will go to map selection
            HStack {
                Spacer()
                TextField(
                    "Neighborhood",
                    text: $neighborhood
                )
                .font(.title2)
                .foregroundStyle(Color.black)
                .bold()
            }
            
        }
        .padding()
        
    }
}

#Preview {
    RegisterNewCatView()
}
