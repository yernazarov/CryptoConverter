

import Foundation

struct Quote{
    var id: String = ""
    var currency: String = ""
    var symbol: String = ""
    var name: String = ""
    var logo_url = ""
    var rank: Int = 0
    var price: Double = 0.0
    var price_date: String = ""
    var price_timestamp: String = ""
    var market_cap: Int = 0
    var circulating_supply: Int = 0
    var max_supply: Int = 0
    var price_change: Double = 0.0
    var price_change_pct: Double = 0
    var volume: Double = 0.0
    var volume_change: Double = 0.0
    var volume_change_pct: Double = 0.0
    var market_cap_change: Double = 0.0
    var market_cap_change_pct: Double = 0.0
    mutating func description() -> String{
        var output: String
        output = "symbol: \(self.symbol)\nname: \(self.name)\nlogo_url: \(self.logo_url)\nrank: №\(self.rank)\n"                                   + "price: \(self.price)$\nprice date: \(self.price_date)\nprice timestamp: \(self.price_timestamp)\n"
        + "market cap: \(self.market_cap)$\ncirculating supply: \(self.circulating_supply)\nmax supply: \(self.max_supply)"
        return output
    }
}
