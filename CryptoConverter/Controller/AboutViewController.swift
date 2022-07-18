//
//  AboutViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/9/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutBackground: UIImageView!
    @IBOutlet weak var information: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutBackground?.image = UIImage(named: "32210")
        information?.text = "Currency converter app\n Designed by Zhandos Yernazarov\nemail: zhandos.yernazarov@nu.edu.kz"
    } 
}
