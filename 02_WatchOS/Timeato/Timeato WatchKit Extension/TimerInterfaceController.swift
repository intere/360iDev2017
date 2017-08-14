//
//  InterfaceController.swift
//  Timeato WatchKit Extension
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications
import WatchConnectivity


class TimerInterfaceController: WKInterfaceController {

    @IBOutlet weak var timerLabel: WKInterfaceTimer?
    @IBOutlet weak var timerButton: WKInterfaceButton?
    var running = false
    var timer: Timer?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        timerLabel?.setDate(TimerSettings.shared.timerEndDate)
    }

    @IBAction
    func startTimerButtonPressed() {
        if running {
            stopTimer()
        } else {
            beginTimer()
        }
    }

    @IBAction
    func showSettings() {
        presentController(withName: "TimerSettings", context: nil)
    }

}

// MARK: - Implementation

extension TimerInterfaceController {

    func stopTimer() {
        timerLabel?.stop()
        timerButton?.setTitle("Start Timer")
        running = false
    }

    func beginTimer() {
        let endDate = TimerSettings.shared.timerEndDate

        // This value defaults to false. An app remains the frontmost app for two minutes after the user drops their wrist.
        // Setting this property to true extends the app's time as the frontmost app to eight minutes.
        if #available(watchOSApplicationExtension 4.0, *) {
            WKExtension.shared().isFrontmostTimeoutExtended = true
        }
        
        if #available(watchOSApplicationExtension 3.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (authorized, error) in
                if let error = error {
                    return NSLog(error.localizedDescription)
                }

                if authorized {
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: endDate.timeIntervalSinceNow, repeats: false)
                    let content = UNMutableNotificationContent()
                    content.title = "Timer Finished"
                    content.body = "Your timer finished"

                    let request = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { (error) in
                        if let error = error {
                            return NSLog(error.localizedDescription)
                        }

                    }
                }
            }
        } else {
            WCSession.default.sendMessage(["TimerEndDate": endDate], replyHandler: nil, errorHandler: { (error) in
                NSLog(error.localizedDescription)
            })
        }

        TimerSettings.shared.currentTimerEndDate = TimerSettings.shared.timerEndDate
        timerLabel?.setDate(TimerSettings.shared.timerEndDate)
        timerLabel?.start()
        timerButton?.setTitle("Stop Timer")
        running = true
    }

    func startTimer() {
        guard let interval = TimerSettings.shared.timerComponents.date?.timeIntervalSinceNow else {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerCompleted), userInfo: nil, repeats: false)
        WKInterfaceDevice.current().play(.start)
    }

    @objc
    func timerCompleted() {
        WKInterfaceDevice.current().play(.success)
    }
}

