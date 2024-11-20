//
//  HMFont.swift
//  HMTheme
//
//  Created by CNCEMN188807 on 2024/7/18.
//

import Theme_RxSwift

/// 字体
public enum HMFontName: String {
    
    // MARK: - 通用字体
        
    case poppinsBold = "Poppins-Bold"
    
    case poppinsExtraBold = "Poppins-ExtraBold"
        
    case poppinsMedium = "Poppins-Medium"
        
    case poppinsRegular = "Poppins-Regular"
        
    case poppinsSemiBold = "Poppins-SemiBold"
    
    // MARK: - 品牌字体
    
    /// HK 品牌字体 ProximaNova-Bold
    case proximaNovaBold = "ProximaNova-Bold"
    
    /// HK 品牌字体 ProximaNova-Semibold
    case proximaNovaSemibold = "ProximaNova-Semibold"
    
    /// JBL品牌字体 RocGrotesk-CondensedBold
    case rocGroteskCondensedBold = "RocGrotesk-CondensedBold"
}

extension UIFont {
    
    /// 注册自定义字体
    public static func registerCustomTTFFont() {
//        guard let dirPath = Bundle.main.path(forResource: "TTFFont", ofType: nil) else { return }
//        dirPath = dirPath.appending("/HMFont")
        TTFFont.registerFont(dirPath: Bundle.main.bundlePath)
    }
    
    /// 初始化自定义字体
    /// - Parameters:
    ///   - name: 字体name
    ///   - size: 字体size
    /// - Returns: UIFont
    public static func font(_ name: HMFontName, size: CGFloat) -> UIFont {
        return TTFFont.font(name: name.rawValue, size: size)
    }
}
