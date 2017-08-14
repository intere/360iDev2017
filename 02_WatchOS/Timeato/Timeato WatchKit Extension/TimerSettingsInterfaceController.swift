//
//  TimerSettingsInterfaceController.swift
//  Timeato WatchKit Extension
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import WatchKit
import Foundation

class TimerSettingsInterfaceController: WKInterfaceController {

    @IBOutlet weak var timerLabel: WKInterfaceTimer?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        updateUI()
    }

    @IBAction
    func timerLengthSliderChange(_ value: Float) {
        let minutes = Int(max(1, value))
        TimerSettings.shared.timerLength = minutes
        updateUI()
    }

    func updateUI() {
//        let timerLength = TimerSettings.shared.timerLength
//        let components = DateComponents(minute: timerLength)
//        guard let endDate = Calendar.current.date(byAdding: components, to: Date()) else {
//            fatalError("The world has ended!")
//            return
//        }
//
//        timerLabel?.setDate(endDate)
        timerLabel?.setDate(TimerSettings.shared.timerEndDate)
    }
}
