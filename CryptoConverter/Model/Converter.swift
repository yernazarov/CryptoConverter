

import Foundation

class Converter  {
    var baseQuote: Double
    init(baseQuote: Double) {
        self.baseQuote = baseQuote
    }
    deinit{
        print("Converter object was destroyed")
    }
    func convert( _ currencyAmount: Double, _ convertQuote: Double) -> Double{
        return currencyAmount * convertQuote/baseQuote
    }
}
