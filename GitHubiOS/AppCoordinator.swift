//
//  AppCoordinator.swift
//  GitHubiOS
//
//  Created by Aleksander Maj on 29/03/2018.
//  Copyright © 2018 HTD. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func didFinishLaunching(with launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        let glossaryVC = GlossaryViewController(nibName: "GlossaryViewController", bundle: nil)
        window.rootViewController = UINavigationController(rootViewController: glossaryVC)
        window.makeKeyAndVisible()
    }
}
