# Theme-RxSwift

[![CI Status](https://img.shields.io/travis/galenu/Theme-RxSwift.svg?style=flat)](https://travis-ci.org/galenu/Theme-RxSwift)
[![Version](https://img.shields.io/cocoapods/v/Theme-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Theme-RxSwift)
[![License](https://img.shields.io/cocoapods/l/Theme-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Theme-RxSwift)
[![Platform](https://img.shields.io/cocoapods/p/Theme-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Theme-RxSwift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Theme-RxSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Theme-RxSwift'
```

```
view.theme.backgroundColor = .color(\.bgPage)
        
view.theme.changed = .theme({

            print("主题改变: \(HMTheme.shared.themeType)")
            
            if let lottie_wifi_connect = URL.url(forResource: "lottie_wifi_connect.json") {
                print("lottie_wifi_connect: \(lottie_wifi_connect.absoluteString)")
            }
            
            if let video_welcome_placeholder = URL.url(forResource: "video_welcome_placeholder.mp4") {
                print("video_welcome_placeholder: \(video_welcome_placeholder.absoluteString)")
            }
        })

btn.theme.backgroundColor = .color(\.buttonNormalBg)
btn.theme.setTitleColor(.color(\.textMinor), for: .normal)

imageView.theme.image = .image(named: "base/logo")
        
label.theme.textColor = .color(\.textMajor)
```

## Author

galenu, 250167616@qq.com

## License

Theme-RxSwift is available under the MIT license. See the LICENSE file for more info.
