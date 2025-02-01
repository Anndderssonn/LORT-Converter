//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Andersson on 24/01/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var topAmount = ""
    @State var bottomAmount = ""
    @State var topCurrency: CurrencyModel = .silverPiece
    @State var bottomCurrency: CurrencyModel = .goldPiece
    
    @FocusState var topTyping
    @FocusState var bottomTyping
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                VStack {
                    ConverterSection(amount: $topAmount, showSelectCurrency: $showSelectCurrency, currentCurrency: topCurrency)
                        .focused($topTyping)
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        .padding()
                    ConverterSection(amount: $bottomAmount, showSelectCurrency: $showSelectCurrency, currentCurrency: bottomCurrency)
                        .focused($bottomTyping)
                }
                .padding()
                .background(.black.opacity(0.5))
                .keyboardType(.decimalPad)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            hideKeyboard()
                        }
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: topAmount) {
            if topTyping {
                bottomAmount = topCurrency.convert(topAmount, to: bottomCurrency)
            }
        }
        .onChange(of: bottomAmount) {
            if bottomTyping {
                topAmount = bottomCurrency.convert(bottomAmount, to: topCurrency)
            }
        }
        .onChange(of: topCurrency) {
            topAmount = bottomCurrency.convert(bottomAmount, to: topCurrency)
            UserDefaults.standard.saveCurrency(currency: topCurrency, position: .top)
        }
        .onChange(of: bottomCurrency) {
            bottomAmount = topCurrency.convert(topAmount, to: bottomCurrency)
            UserDefaults.standard.saveCurrency(currency: bottomCurrency, position: .bottom)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(selectedCurrencyStartingWith: $topCurrency, selectedCurrencyConvertTo: $bottomCurrency)
        }
        .onAppear {
            let (loadedTop, loadedBottom) = UserDefaults.standard.loadCurrencies()
            topCurrency = loadedTop
            bottomCurrency = loadedBottom
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
