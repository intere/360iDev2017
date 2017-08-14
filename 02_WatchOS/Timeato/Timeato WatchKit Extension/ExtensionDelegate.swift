//
//  ExtensionDelegate.swift
//  Timeato WatchKit Extension
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import WatchKit
import UserNotifications
import WatchConnectivity

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        if #available(watchOSApplicationExtension 3.0, *) {
            UNUserNotificationCenter.current().delegate = self
        } else {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
}

// MARK: - WCSessionDelegate

extension ExtensionDelegate: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

}

// MARK: - UNUserNotificationCenterDelegate

extension ExtensionDelegate: UNUserNotificationCenterDelegate {

    @available(watchOSApplicationExtension 3.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
