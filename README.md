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
* Sample Code: https://github.com/SlaunchaMan/Timeato
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

### DYNAMIC TYPOGRAPHY & ADAPTIVE LAYOUTS IN IOS 11
* Presenter: `Sean Coleman`
* Slides: https://speakerdeck.com/bjtitus/creating-adaptable-layouts
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

### EVENT DELIVERY IN IOS
* Presenter: `Brandon Alexander`
* Slides: https://github.com/whilethis/360iDev_Event_Delivery

### ADVANCED DEBUGGING WITH XCODE – EXTENDING LLDB
* Slides: https://www.slideshare.net/aijazansari2/360idev

### ADVANCED DATES AND TIMES IN SWIFT
* Presenter: `Jeff Kelley`
* Slides: https://speakerdeck.com/slaunchaman/advanced-dates-and-times-in-swift-360-idev-2017
* Playground: https://360idev-2017.slack.com/archives/C6NHX9DT6/p1502833781000368
* Project (Drop it like its clock): https://github.com/SlaunchaMan/DropItLikeItsClock

### ADVANCED BUILDING APPS FOR APPLE TV
* Slides: https://github.com/justindomnitz/iDev2017_tvOS
* Sample Code: https://github.com/justindomnitz/iDev2016_tvOS

## Tuesday

### PLAYING NICE WITH DESIGN
* Presenter: `Ellen Shapiro`
* Slides:
* Some talking points:
    * TrueColors (Open Source: TBD)
    * Sourcery: https://github.com/krzysztofzablocki/Sourcery
    * "Uniform" (Interactive Style Guide):
    * Using playgrounds to work with your designers
    * `Playgroundbook` - Ruby framework for building playground books:
        * https://github.com/playgroundbooks/playgroundbook
    * For now, have your designers run Xcode to run your playground (from your workspace)
        * Add a run script to launch the playground (see slides)

### CREATING ADAPTABLE LAYOUTS USING TRAIT COLLECTIONS AND CONTAINER VIEWS
* Presenter: `Brandon Titus`
* Slides: https://speakerdeck.com/bjtitus/creating-adaptable-layouts

### DEEP LEARNING ON IOS
* Presenter: `Shuichi Tsutsumi`
* Slides: https://www.slideshare.net/t26v0748/deep-learning-on-ios
* Sample Code: https://github.com/shu223/iOS-10-Sampler
* Github: https://github.com/shu223 (iOS Samplers)
* How to implement "Deep Learning" on iOS
* "Pose Estimation" example
* Demo - app that recognizes over 1000 types of objects (while in airplane mode)
    * Pre-trained models (inference) take considerably less CPU and can run on a mobile device
* CoreML (iOS11)
    * Uses Metal Performance Shaders (MPSCNN) - GPU - iOS10
    * Uses Accelerate (BNNS) - CPU - iOS10
* 3 steps
    1. Create the Model
        * What tools can be used for the training?
            * TensorFlow
            * Caffe
            * Keras
            * Any other format can be used as long as it can be read by the app: `.dat`, `.hdf5`
    2. Implementing the Network
        * Classes corresponding to each CNN layers are provided:
            * MPSCNNConvolution (Convolution)
            * MPSSCNNPooling (Pooling)
            * MPSCNNFullyConnected (Fully Connected)
        * Complicated math or GPU optimization are encapsulated
    3.  Implement the inference
        * MPSImage: Input Image
        * CNN: trained params are loaded
        * Result
* Demo: Swift Logo detection
    * Trained the model using Tensor Flow
    * 2000 lines of code for the shader implementation
    * CoreML:
        1. Convert w/ coremltools
        2. Drag & Drop model -> xcode -> generate Swift
* Vision framework sits on top of CoreML
    * You don't have to touch metal to use the vision framework
* You should generally choose MPSCNN (GPU) over BNNS (CPU) for ML

### TensorFlow on iOS
* Presenter: `Taylan Pince` @tylanpince
* Slides: https://speakerdeck.com/taylanpince/tensorflow-neural-networks-on-ios
* Links:
    * http://machinethink.net/blog/tensorflow-on-ios/ - Great introductory tutorial on gathering your data, training on a custom model, setting up TensorFlow, converting to a mobile optimized network, and loading it up on an iOS app
    * http://www.reza.codes/2017-07-29/how-to-train-your-own-dataset-for-coreml/ - Detailed tutorial on how to train your own model for CoreML
* Interesting (Related) Projects
    * ImageNet - open DB of pre-tagged images
    * Kaggle - https://www.kaggle.com/ - The Home of Data Science & Machine Learning
* Very much "trial and error", not "science"
* 10% of your "data" should be used for training data, and the remaining for testing
    * don't cross the streams!
* Tensorflow
    * produces a `pb file`
    * C++ Library
    * Adds about 40MB to final binary size
    * Can't use bitcode
    * Cannot use GPU (uses CPU)
    * Tensorflow - use `freeze_graph` & `optimize_for_inference`
    * Import final `pb` file into Xcode project
* CoreML
    * Pretrained Models
        * Inception v3
        * VGG16
        * MobileNet
        * SqueezeNet
    * Custom Models
        * Convert Caffe or Keras models with coremltools
        * import mlmodel into your xcode project
* Metal
    * Low-level API behind CoreML
    * Always runs on GPU
    * Got tons of love with iOS11 updates
    * Apple has the full inception v3 model implemented in model as sample code
    * Convert `pb` file into a binary metal can read
* Recap
    * Train with TensorFlow + Keras
    * Use CoreML if you can
    * Use TF if you need multi-platform
* Lots of Apple Samples

### Life Beyond Storyboards
* Presenter: `Ryan Poolos`
* Layout Anchors

### IMPLEMENTING CONTINUOUS DELIVERY WITH IOS
* Presenter: `Cassie Shum`
* Slides: https://speakerdeck.com/cassiend/ios-with-continuous-delivery

### THREADS, QUEUES, AND THINGS TO COME: THE PRESENT AND FUTURE OF CONCURRENCY IN SWIFT
* Presenter: `Ben DiFrancesco`
* Slides:
* Sample Code: https://github.com/apbendi/ConNews
* GCD, (NS)Operation

### ADVANCED DRAWING TECHNIQUES WITH UIBEZIERPATH AND APPLE PENCIL
* Presenter: `Nick Dalton`
* Slides / Code Samples: https://github.com/iNick/360iDev-2017


## Wednesday

### HOW OPEN SOURCE DEVELOPMENT CAN MAKE YOU A BETTER DEVELOPER
* Presenter: `Arthur Sabintsev`
* Slides https://github.com/ArtSabintsev/360iDev-2017

### THE LATEST IN DEVELOPING FOR WATCHOS
* Presenter: `Conrad Stoll`
* Slides: https://speakerdeck.com/cnstoll/the-latest-in-developing-for-watchos
