//
//  HMTheme+ThemeDynamicValue.swift
//  RxSwiftTheme_Example
//
//  Created by CNCEMN188807 on 2024/11/5.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Theme_RxSwift

extension ThemeDynamicValue {
    
    public static func theme<T>(_ dynamicValue: @escaping (() -> T)) -> ThemeDynamicValue<T> {
        return HMTheme.shared.service.dynamicValue(dynamicValue)
    }
    
    public static func color(_ dynamicValue: @escaping ((HMThemeColor) -> UIColor)) -> ThemeDynamicValue<UIColor> {
        return .theme {
            return dynamicValue(HMTheme.shared.currentTheme.color)
        }
    }
    public static func color(_ dynamicValue: @escaping ((HMThemeColor) -> UIColor)) -> ThemeDynamicValue<UIColor?> {
        return .theme {
            return dynamicValue(HMTheme.shared.currentTheme.color)
        }
    }
    
    public static func font(_ dynamicValue: @escaping ((HMThemeFont) -> UIFont)) -> ThemeDynamicValue<UIFont> {
        return .theme  {
            return dynamicValue(HMTheme.shared.currentTheme.font)
        }
    }
    public static func font(_ dynamicValue: @escaping ((HMThemeFont) -> UIFont)) -> ThemeDynamicValue<UIFont?> {
        return .theme  {
            return dynamicValue(HMTheme.shared.currentTheme.font)
        }
    }
    
    public static func image(named name: String) -> ThemeDynamicValue<UIImage?> {
        return .theme {
            return UIImage.image(named: name)
        }
    }
}

extension UIImage {
    
    public static func image(named name: String) -> UIImage? {
        var image = UIImage(named: name, in: HMTheme.shared.currentTheme.bundle, compatibleWith: nil)
        if image == nil {
            image = UIImage(named: name, in: HMTheme.shared.lightTheme.bundle, compatibleWith: nil)
        }
        return image
    }
}

extension URL {
    
    public static func url(forResource name: String?, withExtension ext: String? = nil) -> URL? {
        var url: URL?
        if let currentUrl = HMTheme.shared.currentTheme.bundle.url(forResource: name, withExtension: ext) {
            url = currentUrl
        }
        if url == nil {
            if let defaultUrl = HMTheme.shared.lightTheme.bundle.url(forResource: name, withExtension: ext) {
                url = defaultUrl
            }
        }
        return url
    }
}
