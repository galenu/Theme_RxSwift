//
//  HMLightTheme.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/5.
//

import UIKit

public protocol HMThemeable {
        
    /// 主题颜色
    var color: HMThemeColor { get }
    
    /// 主题字体
    var font: HMThemeFont { get }
    
    /// 图片、json等资源Bundle
    var bundle: Bundle { get }
}

public class HMLightTheme: HMThemeable {
        
    public var color: HMThemeColor = HMThemeColor()
    public var font: HMThemeFont = HMThemeFont()
    
    public var bundle: Bundle {
        return .main
    }
}

public class HMThemeColor {
    
    public var bgPage: UIColor {
        return UIColor.white
    }
    
    public var buttonDisableBg: UIColor {
        return UIColor.green
    }
    public var buttonDisableTitle: UIColor {
        return UIColor.red
    }
    public var buttonNormalBg: UIColor {
        return UIColor(red: 20.0 / 255.0, green: 10.0 / 255.0, blue: 70.0 / 255.0, alpha: 1)
    }
    public var buttonNormalTitle: UIColor {
        return UIColor.blue
    }
    
    public var textMajor: UIColor {
        return UIColor.black
    }
    
    public var textMinor: UIColor {
        return UIColor(white: 0.8, alpha: 1)
    }
}

public class HMThemeFont {
    
    public var title1: UIFont {
        return .font(.rocGroteskCondensedBold, size: 30)
    }
    
    public var title2: UIFont {
        return .font(.rocGroteskCondensedBold, size: 20)
    }
}
