//
//  SceneDelegate.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 4/15/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var quoteProvider: QuoteProvider?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let quoteNav = window?.rootViewController as? UINavigationController {
            if let quoteTVC = quoteNav.topViewController as? QuoteTableViewController{
                quoteProvider = QuoteProvider(delegate: quoteTVC)
                quoteTVC.provider = quoteProvider
            }
            
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

