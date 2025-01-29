//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Andersson on 27/01/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCurrencyStartingWith: CurrencyModel
    @Binding var selectedCurrencyConvertTo: CurrencyModel
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $selectedCurrencyStartingWith)
                    .padding()
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $selectedCurrencyConvertTo)
                    .padding()
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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrencySelected: CurrencyModel = .silverPenny
    @Previewable @State var bottomCurrencySelected: CurrencyModel = .goldPenny
    SelectCurrency(selectedCurrencyStartingWith: $topCurrencySelected, selectedCurrencyConvertTo: $bottomCurrencySelected)
}
