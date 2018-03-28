# News Reader

Simple demo app that loads and displays news articles. There are 4 versions of the app:

* `Newsreader-mvc`: implements the app using a MVC architecture
* `Newsreader-mvc-c`: uses MVC with the Coordinator pattern
* `Newsreader-mvvm-c`: uses Model-View-ViewModel (MVVM) with the Coordinator pattern
* `Newsreader-mvvm-c-r`: uses MVVM with the Coordinator, but separates netwoking logic from view models
* `Newsreader-mvvm-c-rx`: uses MVVM with the Coordinator pattern and RxSwift

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) needs to be installed to run this demo app. Once installed, run the followings command in each project's root folder to configure and open the project:

```ruby
pod install
```

### API Key 

An API key is necessary to successfully connect to the [API](https://developer.nytimes.com/signup) that the app uses. Once an API key has been aquired, change the `apiKey` property in `HttpConfiguration.swift` and run the app.

## Requirements
- Cocoapods
- iOS 11.0
- Xcode 9, Swift 4
