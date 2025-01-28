//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Andersson on 27/01/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 110)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .silverpenny, currencyName: "Silver Penny")
}
