//
//  ButtonWithImageView.swift
//  Pawbook
//
//  Created by Ege Çam on 4.02.2024.
//

import SwiftUI

struct ButtonWithImageView: View {
    let title: String
    let image: String?
    let color: Color
    
    var body: some View {
        ZStack {
            color
                .opacity(0.25)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 250, height: 60)
                
            HStack {
                if(image != nil) {
                    Image(systemName: image!)
                        .foregroundStyle(color)
                        .font(.title3)
                }
                
                Text(title)
                    .font(.title3)
                    .foregroundStyle(color)
            }
        }
    }
}

#Preview {
    ButtonWithImageView(title: "Register a paw", image: "plus.square.dashed", color: .orange)
}
