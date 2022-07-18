//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 4/19/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//
import Foundation

protocol QuoteProviderDelegate {
    func provideQuotes(quotes: [Quote])
}
class QuoteProvider: QuoteProviderProtocol{
    var delegate: QuoteProviderDelegate?

    init(delegate: QuoteProviderDelegate){
        self.delegate = delegate
    }
    func requestQuotes(){
        let quotes = generateQuotes()
        delegate?.provideQuotes(quotes: quotes)
    }
    func returnTimestamp() -> String{
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
        return timestamp
    }
    
    func generateQuotes() -> [Quote]{ //input is not needed
        var quoteObjects = [Quote?](repeating: nil, count: 5)
        quoteObjects[0] = Quote(id: "BTC", currency: "BTC", symbol: "BTC", name: "Bitcoin", logo_url: "bitcoin", rank: 1, price_date: returnTimestamp(), price_timestamp: returnTimestamp())
        quoteObjects[1] = Quote(id: "ETH", currency: "ETH", symbol: "ETH", name: "Ehterium", logo_url: "etherium", rank: 2, price_date: returnTimestamp(), price_timestamp: returnTimestamp())
        quoteObjects[2] = Quote(id: "RUB", currency: "RUB", symbol: "RUB", name: "Ruble", logo_url: "ruble", rank: 3, price_date: returnTimestamp(), price_timestamp: returnTimestamp())
        quoteObjects[3] = Quote(id: "KZT", currency: "KZT", symbol: "KZT", name: "Tenge", logo_url: "tenge", rank: 4, price_date: returnTimestamp(), price_timestamp: returnTimestamp())
        quoteObjects[4] = Quote(id: "EUR", currency: "EUR", symbol: "EUR", name: "Euro", logo_url:  "euro", rank: 5, price_date: returnTimestamp(), price_timestamp: returnTimestamp())
        for i in 0...4{
            quoteObjects[i]?.price = Double.random(in: 0 ... 10000)
            quoteObjects[i]?.market_cap = Int.random(in: 1000000 ... 100000000)
            quoteObjects[i]?.circulating_supply = Int.random(in: 10000 ... 100000)
            quoteObjects[i]?.max_supply = Int.random(in: 10000 ... 100000)
        }
        return quoteObjects as! [Quote]
    }
}
