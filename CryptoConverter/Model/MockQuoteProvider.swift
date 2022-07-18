//
//  MockQuoteProvider.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 4/19/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import Foundation

class MockQuoteProvider: QuoteProviderProtocol {
    var delegate: QuoteProviderDelegate? //опционал тк делегата может не быть

    init(delegate: QuoteProviderDelegate) {
        self.delegate = delegate
    }
    lazy var quoteObject = QuoteProvider(delegate: delegate!)
    func requestQuotes() {
        delegate?.provideQuotes(quotes:  quoteObject.generateQuotes())
    }
}
