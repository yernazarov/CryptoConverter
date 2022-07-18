//
//  MainTabController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/8/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let quoteNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "QuoteNavigationController") as? QuoteNavigationController
        if let quoteTVC = quoteNavigationController?.topViewController as? QuoteTableViewController{
            let quoteProvider = QuoteProvider(delegate: quoteTVC)
            quoteTVC.provider = quoteProvider
        }
        let converterViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConverterViewController") as? ConverterViewController
        let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController
        converterViewController!.title = "Converter"
        aboutViewController!.title = "About"
        quoteNavigationController?.tabBarItem.image = UIImage(named: "coin")
        converterViewController?.tabBarItem.image = UIImage(named: "calculator")
        aboutViewController?.tabBarItem.image = UIImage(named: "info")
        self.viewControllers = [quoteNavigationController!, converterViewController!, aboutViewController!]
        
    }
}
