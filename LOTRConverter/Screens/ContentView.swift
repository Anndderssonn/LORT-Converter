//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Andersson on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @FocusState var topTyping
    @FocusState var bottomTyping
    @State var topAmount = ""
    @State var bottomAmount = ""
    @State var topCurrency: CurrencyModel = .silverPiece
    @State var bottomCurrency: CurrencyModel = .goldPiece
    
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
                    VStack {
                        HStack {
                            Image(topCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            Text(topCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $topAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .focused($topTyping)
                            .onChange(of: topAmount) {
                                if topTyping {
                                    bottomAmount = topCurrency.convert(topAmount, to: bottomCurrency)
                                }
                            }
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        .padding()
                    VStack {
                        TextField("Amount", text: $bottomAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .focused($bottomTyping)
                            .onChange(of: bottomAmount) {
                                if bottomTyping {
                                    topAmount = bottomCurrency.convert(bottomAmount, to: topCurrency)
                                }
                            }
                        HStack {
                            Image(bottomCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            Text(bottomCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
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
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(selectedCurrencyStartingWith: $topCurrency, selectedCurrencyConvertTo: $bottomCurrency)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
