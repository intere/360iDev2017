//
//  AppDelegate.swift
//  Timeato
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        WCSession.default.delegate = self
        WCSession.default.activate()
        return true
    }


}

// MARK: - WCSessionDelegate

extension AppDelegate: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let endDate = message["TimerEndDate"] as? Date {
            let notification = UILocalNotification()
            notification.alertTitle = "Timer Finished"
            notification.alertBody = "Your timer has finished."
            notification.fireDate = endDate
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
}
