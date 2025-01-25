//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Andersson on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var topAmount = ""
    @State var bottomAmount = ""
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        TextField("Amount", text: $topAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding()
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
                        HStack {
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
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
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
