//
//  ComplicationController.swift
//  Timeato WatchKit Extension
//
//  Created by Eric Internicola on 8/13/17.
//  Copyright © 2017 Eric Internicola. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        NSLog("\(String(describing: TimerSettings.shared.currentTimerStartDate))")
        handler(TimerSettings.shared.currentTimerStartDate)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        guard let endDate = TimerSettings.shared.currentTimerEndDate else {
            return handler(nil)
        }

        handler(endDate + 1)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        guard let template = TimerSettings.shared.isTimerRunning ? complicationTemplate(for: complication.family) : inactiveComplicationTemplate(for: complication.family) else {
            return handler(nil)
        }

        switch complication.family {
        case .extraLarge:
            let entry = CLKComplicationTimelineEntry(date: TimerSettings.shared.currentTimerStartDate ?? Date(), complicationTemplate: template)
            handler(entry)

        default:
            handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var entries = [CLKComplicationTimelineEntry]()

        if TimerSettings.shared.isTimerRunning {
            if date > TimerSettings.shared.currentTimerStartDate ?? Date() {
                if let template = complicationTemplate(for: complication.family) {
                    let timelineEntry = CLKComplicationTimelineEntry(date: TimerSettings.shared.currentTimerEndDate!, complicationTemplate: template)
                    entries.append(timelineEntry)
                }
            }
            if let template = inactiveComplicationTemplate(for: complication.family) {
                let timelineEntry = CLKComplicationTimelineEntry(date: TimerSettings.shared.currentTimerEndDate!, complicationTemplate: template)
                entries.append(timelineEntry)
            }
        }

        // Call the handler with the timeline entries after to the given date
        handler(entries)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var entries = [CLKComplicationTimelineEntry]()

        if TimerSettings.shared.isTimerRunning {
            if date < TimerSettings.shared.currentTimerStartDate ?? Date() {
                if let template = complicationTemplate(for: complication.family) {
                    let timelineEntry = CLKComplicationTimelineEntry(date: TimerSettings.shared.currentTimerEndDate!, complicationTemplate: template)
                    entries.append(timelineEntry)
                }
            }
            if let template = inactiveComplicationTemplate(for: complication.family) {
                let timelineEntry = CLKComplicationTimelineEntry(date: TimerSettings.shared.currentTimerEndDate!, complicationTemplate: template)
                entries.append(timelineEntry)
            }
        }

        // Call the handler with the timeline entries after to the given date
        handler(entries)
    }
    
    // MARK: - Placeholder Templates

    // Runs at "install time"

    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}

// MARK: - Implementation

extension ComplicationController {

    func inactiveComplicationTemplate(for family: CLKComplicationFamily) -> CLKComplicationTemplate? {
        switch family {
        case .extraLarge:
            if #available(watchOSApplicationExtension 3.0, *) {
                let template = CLKComplicationTemplateExtraLargeSimpleText()
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                template.textProvider = CLKSimpleTextProvider(text: formatter.string(from: TimerSettings.shared.timerComponents)!)

                return template
            } else {
                return nil
            }


        default:
            return nil
        }
    }

    func complicationTemplate(for family: CLKComplicationFamily) -> CLKComplicationTemplate? {
        switch family {
        case .extraLarge:
            if #available(watchOSApplicationExtension 3.0, *) {
                let template = CLKComplicationTemplateExtraLargeSimpleText()
                template.textProvider = CLKRelativeDateTextProvider(date: TimerSettings.shared.currentTimerEndDate ?? TimerSettings.shared.timerEndDate, style: .timer, units: [.minute, .second])
                return template
            } else {
                return nil
            }

        default:
            return nil
        }
    }

}
