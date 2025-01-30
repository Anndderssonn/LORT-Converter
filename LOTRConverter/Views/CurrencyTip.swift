//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Andersson on 29/01/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change currency 💰")
    var message: Text? = Text("You can tap the left or right currency to bring up the select currency screen.")
    var image: Image? = Image(systemName: "hand.tap.fill")
}
