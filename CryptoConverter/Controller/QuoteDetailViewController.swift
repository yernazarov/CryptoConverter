//
//  QuoteDetailViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 4/19/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {
    @IBOutlet var quoteLabel: UILabel?
    @IBOutlet var logo_url: UIImageView?
    var quote: Quote?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = quote!.name
        quoteLabel?.text = quote?.description()
        logo_url?.image = UIImage(named: quote!.logo_url)
        
    }
}
