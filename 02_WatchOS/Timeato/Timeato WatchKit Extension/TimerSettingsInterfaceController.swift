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
    @IBOutlet weak var timerSlider: WKInterfaceSlider?

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
        timerLabel?.setDate(TimerSettings.shared.timerEndDate)
        timerSlider?.setValue(Float(TimerSettings.shared.timerLength))
    }
}
