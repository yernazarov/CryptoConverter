//
//  MainViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/8/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {
    var tabBarViewController: UITabBarController!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarController()
    }
    func addTabbarController(){
        tabBarViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as? UITabBarController)!
        tabBarViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        addChild(tabBarViewController)
        self.view.addSubview(tabBarViewController.view)
        tabBarViewController.didMove(toParent: self)
    }

}
