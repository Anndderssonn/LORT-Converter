//
//  CurrencyModel.swift
//  LOTRConverter
//
//  Created by Andersson on 27/01/25.
//

import SwiftUI

enum CurrencyModel: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case bitcoin = 256
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: CurrencyModel { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny: return .copperpenny
        case .bitcoin: return .bitcoin
        case .silverPenny: return .silverpenny
        case .silverPiece: return .silverpiece
        case .goldPenny: return .goldpenny
        case .goldPiece: return .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny: return "Copper Penny"
        case .bitcoin: return "Bitcoin"
        case .silverPenny: return "Silver Penny"
        case .silverPiece: return "Silver Piece"
        case .goldPenny: return "Gold Penny"
        case .goldPiece: return "Gold Piece"
        }
    }
    
    func convert(_ amount: String, to currency: CurrencyModel) -> String {
        guard let amount = Double(amount) else { return "" }
        let result = (amount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", result)
    }
}

enum CurrencyPosition {
    case top
    case bottom
}
