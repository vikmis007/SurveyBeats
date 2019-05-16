# SurveyBeats
[![license](https://img.shields.io/github/license/DAVFoundation/captain-n3m0.svg?style=flat-square)](https://github.com/vikmis007/SurveyBeats/LICENSE)

App to show List of available surveys. Written in Swift version 4.2

## Requirements
* iOS 10+
* Xcode 10.1+

## External library dependencies
* [SDWebImage](https://github.com/SDWebImage/SDWebImage) Library to provide an async image downloader with cache support.
* [MBProgressHud](https://github.com/jdg/MBProgressHUD) Library to provide a translucent HUD with an indicator and/or labels while work is being done in an asynchronous task.
* [CMPageControl](https://github.com/Mycose/CMPageControl) Library to show customize page control
* [Quick](https://github.com/Quick/Quick) It is a behavior-driven testing framework for Swift and Objective-C.
* [Nimble](https://github.com/Quick/Nimble) Is is a matcher famework for test cases in Swift and Objective-C.

## Development and quality management tools used
### [CocoaPods](http://cocoapods.org)
CocoaPods is an application level dependency manager for Swift, Objective-C and any other languages that run on the Objective-C runtime, that provides a standard format for managing external libraries.
### [fastlane](https://fastlane.tools/) 
fastlane is an open source CD i.e. continous deployment tool that lets user to automate every aspect of the development and release workflow.
### [Swiftlint](https://github.com/realm/SwiftLint)
It is a tool to enforce Swift style and conventions, loosely based on [GitHub's Swift Style Guide](https://github.com/github/swift-style-guide).
### [Slather](https://github.com/SlatherOrg/slather)
It generates test coverage reports for Xcode projects & hook it into CI.
### [git-flow](https://github.com/nvie/gitflow)
A collection of Git extensions to provide high-level repository operations for [Vincent Driessen's branching model](http://nvie.com/git-model).

## Design Pattern
### MVP Pattern
Model–view–presenter (MVP) is a derivation of the model–view–controller (MVC) architectural pattern, and is used mostly for building user interfaces. In MVP, the presenter assumes the functionality of the "middle-man". In MVP, all presentation logic is pushed to the presenter.

![MVP Design Flow](https://upload.wikimedia.org/wikipedia/commons/d/dc/Model_View_Presenter_GUI_Design_Pattern.png)

## Project features
1. MVP pattern has been used.
2. Quick+Nimble has been used for behaviour driven unit testing.
3. Branching strategy using Git Flow has been followed.
4. Fastlane has been integrated. "development" lane has been set up. It contains following actions, 
    a) scan = To run Unit Test cases
    b) swiftlint = To run lint scanning and generate its report.
    c) slather = To generate code coverage report. (Report generation folder: Slather/)
5. Followed object oriented approach and adapter pattern with dependency injection.
6. Updated Apple APIs like JSONDecoder, etc has been used for parsing JSON response.

## Project setup and execution
1. Clone the project.
2. Install [Cocoapods](https://guides.cocoapods.org/using/getting-started.html#installation) and run pod install.
3. Open `SurveyBeats.xcworkspace` that should start in Xcode.
4. Press `command+r` to run the project in simulator.

## Testing, Linting reports using fastlane
1. Navigate to project root directory.  
2. Install [fastlane](https://docs.fastlane.tools/getting-started/ios/setup/), [Slather](https://github.com/SlatherOrg/slather), [Swiftlint](https://github.com/realm/SwiftLint)
3. Run `bundle exec fastlane development` on terminal.
![fastlane screenshot](https://github.com/serveshwar/news-flash/blob/feature/most-popular-articles/Screenshots/Fastlane_Screenshot.png)
4. Once fastlane finishes, check `Lint/LintReport.html` for swiftlint report.
![Swiftlint report](https://github.com/serveshwar/news-flash/blob/feature/most-popular-articles/Screenshots/Swiftlint_Screenshot.png)
5. Check `Slather/index.html` for unit test code coverage.
![Slather code coverage report](https://github.com/serveshwar/news-flash/blob/feature/most-popular-articles/Screenshots/Slather_Screenshot.png)

## Unit tests and UI tests
1. Open `NewsFlash.xcworkspace` that should start in Xcode.
2. Press `command+u` to run the unit test in Xcode.
![UT](https://github.com/serveshwar/news-flash/blob/feature/most-popular-articles/Screenshots/TestCase_Screenshot.png)
![Code Coverage](https://github.com/serveshwar/news-flash/blob/feature/most-popular-articles/Screenshots/CodeCoverage_Screenshot.png)
