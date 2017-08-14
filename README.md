# 360|iDev

## Sunday

### Workshop 1: BUILD YOUR OWN CUSTOM MUSICAL INSTRUMENT
* Link: https://360idev.com/sessions/build-custom-musical-instrument/
* Presenter: `Aurelius Prochazka`
* Folder: `01_Audio`
* Xcode8

In this workshop we utilized AudioKit to build some custom soundboards.  We
learned about some of the features of the audio support for iOS.

### Workshop 2: DEVELOPING FOR APPLE WATCH WITH SWIFT
* Link: https://360idev.com/sessions/developing-apple-watch-swift/
* Slides: https://speakerdeck.com/slaunchaman/do-i-need-an-apple-watch-app-360-idev-2017
* Presenter: `Jeff Kelley`
* Folder: `02_WatchOS`
* Xcode9

We built a watch app from scratch (a pomodoro timer):
* IB for Watch apps (the only way to build them, no code only VCs)
* Wired up the app itself with a "settings" menu (to configure the length of time)
* Wired up notifications (using UNNotificationCenter)
* Created a complication (Extra large only due to time constraints)
* moved the supported watch version back to add support for older WatchOS versions

### XCODE AND FRIENDS
* Presenter: `Kendall Gelner`
* Materials: https://www.dropbox.com/sh/pyc4uz4ad1aji2f/AAAm9bQ5jXisq4DP5W1tDYjSa?dl=0

## Monday

### HealthKit
* Presenter: `Igor Kantor`
* Folder: `03_HealthKit`
* https://github.com/Iiiggs/AsthmaBuddy - reference app
* https://github.com/ResearchKit/ResearchKit - ResearchKit
* HKUnit - really useful for unit conversions
* HKWorkout - for reporting workouts
* HKQuery Types:
    * HKAnchoredObjectQuery
    * HKCorrelationQuery
    * HKObserverQuery
    * HKSampleQuery
    * HKSourceQuery
    * HKStatisticsQuery
    * HKStatisticsCollectionQuery
* ResearchKit Chart Control: ORKLineGraphChartView

### EXPLORING NEURAL NETWORKS FOR RECOGNITION OF HAND-DRAWN SHAPES
* Presenter: `Chris Parrish`
* Folder: `04_NeuralNetworks`
* Code
    * https://github.com/twenty3/Synapse.git
    * https://github.com/collinhundley/Swift-AI
* Slides: https://www.dropbox.com/s/qhggbpg2z5f4i5c/Exploring%20Neural%20Networks%20v2.pdf?dl=0

Chris presented "Napkin Demo", gesture-based demo on the mac that recognizes a few "shapes"

* Neuron
    * a node that sums incoming `signals` and outputs a signal
    * activation function controls output based on the inputs
* Synapse
    * Connections between neurons
    * Synapse scales or `weights` the input traveling along it

* Sigmoid function is useful for "bucketing" outputs
* `Feed Forward Network` - no feedback
* Simple model: inputs, 1 hidden layer, outputs
* Back propagation and gradient descent
* Youtube has videos on `Gradient Descent` and `Back Propagation`
* http://playground.tensorflow.org
* Book: `Make your own Neural Network` (Rashid, Tariq)
* Capturing the drawing
    * UIPanGestureRecognizer
    * Connect the points in a quadratic BezierPath (normalizing the input)
* WWDC 2012 Session: `Building Advanced Gesture Recognizers`
* Strategy
    * Capture drawing as an image (crop to just the path bounds, normalize the aspect)
    * Scale the image down (just enough pixels to capture the essential features, restroke the path so stroke width is invariant)
    * Convert to Grayscale (RGB would me we'd need 3 input nodes for each pixel)
    * Network expect inputs between (0.0, 1.0) - clamping

## DYNAMIC TYPOGRAPHY & ADAPTIVE LAYOUTS IN IOS 11
* Presenter: `Sean Coleman`
* Font Pairing:
    * Roboto Slab / San Francisco Pro Text (example)
* San Francisco was designed with Accessibility in mind.
    *  Best font to use with dynamic typing
* IOS6: Auto Layout
* IOS7: Dynamic Type
* IOS8: Adaptive Layout
* IOS9: San Francisco font / UIStackView
* IOS10: Automatically Adjust Font / preferredContentSizeCategory
* IOS11: Dynamic Type for custom fonts / Adaptive Layout is ready
* Accessibility Inspector (Xcode9) tool can interact with the simulator (change text size)!
* Common issue: Style Guides != Text Styles
    1. Persuade your stakeholders
    2. Scale (scale the font size based on system scale)
    3. Lookup table
* Adaptive Layouts
    * Show the NYT paper embedded in a iOS Screen 🤣
* Be a platform advocate!

## EVENT DELIVERY IN IOS
* Presenter: `Brandon Alexander`
* Slides: https://github.com/whilethis/360iDev_Event_Delivery

## ADVANCED DEBUGGING WITH XCODE – EXTENDING LLDB
* Slides: https://www.slideshare.net/aijazansari2/360idev

## ADVANCED DATES AND TIMES IN SWIFT
* Presenter: `Jeff Kelley`
* Slides: https://speakerdeck.com/slaunchaman/advanced-dates-and-times-in-swift-360-idev-2017
