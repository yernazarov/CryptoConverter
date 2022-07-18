//
//  NotificationProvider.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/9/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import Foundation

let NotificationSendQuoteList = NSNotification.Name("notification_quote_list")
let NotificationSendSelectedQuote = NSNotification.Name("notification_quote_select")

class NotificationProvider{
    var timer: Timer?
    lazy var quoteProvider = QuoteProvider(delegate: self)
    
    deinit {
        stop()
    }
    
    func start() {
        sendMessage()
        timer = Timer.scheduledTimer(withTimeInterval: 5,
                                     repeats: true,
                                     block: {[weak self]_ in self?.sendMessage()})
    }
    
    func sendMessage(){
        print("send message")
        quoteProvider.requestQuotes()
    }
    
    func stop(){
        timer?.invalidate()
        timer = nil
    }
}
extension NotificationProvider: QuoteProviderDelegate{
    func provideQuotes(quotes: [Quote]){
        NotificationCenter.default.post(name: NotificationSendQuoteList, object: quotes)
    }
    
}
