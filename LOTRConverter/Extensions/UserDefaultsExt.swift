//
//  UserDefaultsExt.swift
//  LOTRConverter
//
//  Created by Andersson on 30/01/25.
//

import SwiftUI

extension UserDefaults {
    func saveCurrency(currency: CurrencyModel, position: CurrencyPosition) {
        if position == .top {
            set(currency.rawValue, forKey: "topCurrency")
        } else {
            set(currency.rawValue, forKey: "bottomCurrency")
        }
        synchronize()
    }
    
    func loadCurrencies() -> (CurrencyModel, CurrencyModel) {
        let topRawValue = double(forKey: "topCurrency")
        let bottomRawValue = double(forKey: "bottomCurrency")
        
        let topCurrency = CurrencyModel(rawValue: topRawValue) ?? .silverPiece
        let bottomCurrency = CurrencyModel(rawValue: bottomRawValue) ?? .goldPiece
        
        return (topCurrency, bottomCurrency)
    }
}
