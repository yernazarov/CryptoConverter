//
//  LaunchScreenViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/10/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView?.image = UIImage(named: "launch")
}
}
