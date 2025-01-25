//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Andersson on 25/01/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let description: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            Text(description)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, description: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
