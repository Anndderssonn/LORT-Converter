//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Andersson on 27/01/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: CurrencyModel?
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
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
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.1))
                .font(.title2)
                .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(selectedCurrency: .goldPiece)
}
