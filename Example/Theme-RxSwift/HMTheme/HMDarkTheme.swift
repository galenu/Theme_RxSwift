//
//  HMDarkTheme.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/5.
//

import UIKit

public class HMDarkTheme: HMThemeable {
        
    public var color: HMThemeColor = HMDarkThemeColor()
    public var font: HMThemeFont = HMDarkThemeFont()
    
    public var bundle: Bundle {
        guard let bundlePath = Bundle.main.path(forResource: "ThemeDarkBundle", ofType: "bundle"),
              let bundle = Bundle(path: bundlePath) else {
            return HMTheme.shared.lightTheme.bundle
        }
        return bundle
    }
}

public class HMDarkThemeColor: HMThemeColor {
    
    public override var bgPage: UIColor {
        return UIColor.black
    }
    
    public override var buttonDisableBg: UIColor {
        return UIColor.red
    }
    public override var buttonDisableTitle: UIColor {
        return UIColor.gray
    }
    public override var buttonNormalBg: UIColor {
        return UIColor(red: 200.0 / 255.0, green: 10.0 / 255.0, blue: 250.0 / 255.0, alpha: 1)
    }
    public override var buttonNormalTitle: UIColor {
        return UIColor.white
    }
    
    public override var textMajor: UIColor {
        return UIColor.white
    }
    
    public override var textMinor: UIColor {
        return UIColor(white: 1, alpha: 0.8)
    }
}

public class HMDarkThemeFont: HMThemeFont {
    
    public override var title1: UIFont {
        return .font(.poppinsBold, size: 18)
    }
    
    public override var title2: UIFont {
        return .font(.poppinsRegular, size: 14)
    }
}
