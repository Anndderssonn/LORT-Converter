//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Andersson on 28/01/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: CurrencyModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(CurrencyModel.allCases) { currency in
                if currency == selectedCurrency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCurrency: CurrencyModel = .goldPiece
    IconGrid(selectedCurrency: $selectedCurrency)
}
