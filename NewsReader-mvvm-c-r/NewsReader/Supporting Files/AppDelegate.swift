//
//  AppDelegate.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit
import SwiftyBeaver
let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupLogging()

        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = ApplicationCoordinator(window: window)

        self.window = window
        self.applicationCoordinator = applicationCoordinator

        applicationCoordinator.start()
        
        return true
    }

    private func setupLogging() {
        let console = ConsoleDestination()
        console.format = "$C$L$c $N.$F:$l - $M"
        log.addDestination(console)
    }
    
}
