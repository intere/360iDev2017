//
//  TimerSettings.swift
//  Timeato WatchKit Extension
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import Foundation
import ClockKit

@objcMembers
class TimerSettings {
    static let shared = TimerSettings()
    private init() {
        UserDefaults.standard.register(defaults: ["timerLength": 25])
    }

    var isTimerRunning: Bool {
        return currentTimerEndDate != nil
    }

    var timerLength: Int {
        get {
            return UserDefaults.standard.integer(forKey: "timerLength")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "timerLength")
        }
    }

    var currentTimerEndDate: Date? {
        get {
            return UserDefaults.standard.object(forKey: "timerEndDate") as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "timerEndDate")
        }
    }

    var currentTimerStartDate: Date? {
        get {
            return UserDefaults.standard.object(forKey: "timerStartDate") as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "timerStartDate")
        }
    }

    var timerComponents: DateComponents {
        return DateComponents(minute: timerLength)
    }

    var timerEndDate: Date {
        guard let date = Calendar.current.date(byAdding: timerComponents, to: Date()) else {
            fatalError("We're done")
        }
        return date.addingTimeInterval(1)
    }

}

// MARK: - API

extension TimerSettings {

    func startTimer() {
        currentTimerStartDate = Date()
        currentTimerEndDate = timerEndDate

        CLKComplicationServer.sharedInstance().activeComplications?.forEach { (complication) in
            CLKComplicationServer.sharedInstance().reloadTimeline(for: complication)
//            CLKComplicationServer.sharedInstance().extendTimeline(for: complication)
        }
    }



}
