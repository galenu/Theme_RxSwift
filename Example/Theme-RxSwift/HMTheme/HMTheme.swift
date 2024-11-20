//
//  HMTheme.swift
//  HMThemeService
//
//  Created by CNCEMN188807 on 2024/11/5.
//
import Theme_RxSwift

/// 主题类型
public enum HMThemeType: String {
        
    case light
    
    case dark
}

public class HMTheme {
    
    public var themeType: HMThemeType
    var currentTheme: HMThemeable {
        switch themeType {
        case .light:
            return lightTheme
        case .dark:
            return darkTheme
        }
    }
    
    public static let shared = HMTheme()
    public let service = ThemeService()
    
    public var lightTheme: HMThemeable = HMLightTheme()
    public var darkTheme: HMThemeable = HMDarkTheme()
    
    private init() {
        UIFont.registerCustomTTFFont()
        self.themeType = .light
    }
    
    /// 切换主题
    public func switchTheme(_ type: HMThemeType) {
        self.themeType = type
        self.service.switchTheme(type.rawValue)
    }
}
