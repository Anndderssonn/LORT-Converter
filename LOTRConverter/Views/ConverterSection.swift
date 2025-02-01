//
//  ConverterSection.swift
//  LOTRConverter
//
//  Created by Andersson on 31/01/25.
//

import SwiftUI

struct ConverterSection: View {
    @Binding var amount: String
    @Binding var showSelectCurrency: Bool
    
    var currentCurrency: CurrencyModel
    let currencyTip = CurrencyTip()
    
    var body: some View {
        VStack {
            HStack {
                Image(currentCurrency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                Text(currentCurrency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                showSelectCurrency.toggle()
                currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

#Preview {
    @Previewable @State var amount: String = "5"
    @Previewable @State var showCurrency: Bool = true
    ConverterSection(amount: $amount, showSelectCurrency: $showCurrency, currentCurrency: .bitcoin)
}
