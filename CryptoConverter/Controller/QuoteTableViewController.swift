//
//  ConverterTableViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 4/19/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit
import AVFoundation

protocol QuoteProviderProtocol {
    var delegate: QuoteProviderDelegate? { get set }
    func requestQuotes()
}
class QuoteTableViewController: UITableViewController, QuoteProviderDelegate{
    func provideQuotes(quotes: [Quote]) {
        dataArray = quotes
        tableView.reloadData()
    }

    var isSelectQuoteMode = false
    var provider: QuoteProviderProtocol?
    var dataArray: [Quote] = []
    var player : AVAudioPlayer!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveQuotesNotification), name: NotificationSendQuoteList, object: nil)
    }
    @objc func receiveQuotesNotification(notification: Notification){
        if let quotes = notification.object as? [Quote]{
            dataArray = quotes
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        player.play()
        provider?.requestQuotes()
        
    }
    // MARK: - Table view data source
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundPath = Bundle.main.path(forResource: "blaster", ofType: "wav")
        let url = URL(string: soundPath!)
        player = try! AVAudioPlayer(contentsOf: url!)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCellID", for: indexPath) as! QuoteCell
        let quote = dataArray[indexPath.row]
        cell.quoteNameLabel?.text = quote.name 
        cell.quotePriceLabel?.text = "\(quote.price)$"
        cell.quoteLogo_url?.image = UIImage(named: quote.logo_url)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quote = dataArray[indexPath.row]
        NotificationCenter.default.post(name: NotificationSendSelectedQuote, object: quote)
    }

        // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isSelectQuoteMode == true{
            self.dismiss(animated: true, completion: nil)
            return
        }
        if let destination = segue.destination as? QuoteDetailViewController,
            let cell = sender as? QuoteCell,
                let indexPath = tableView.indexPath(for: cell) {
                    let quote = dataArray[indexPath.row]
                    destination.quote = quote
            }
        }
}
     

