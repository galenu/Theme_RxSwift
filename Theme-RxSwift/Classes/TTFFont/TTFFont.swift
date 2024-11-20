//
//  TTFFont.swift
//  HMTheme
//
//  Created by CNCEMN188807 on 2024/11/20.
//

import Foundation

/// 自定义字体
public class TTFFont {
    
    /// 字体比例  如字体需要根据屏幕大小放大 需要设置对应比例
    public static var fontScale: CGFloat = 1.0
    
    /// 字体小数精确位数
    public static var exactDigit: UInt = 1
        
    /// 注册文件夹路径下的所有自定义ttf/otf字体
    /// - Parameter dirPath: 字体所处文件夹的路径
    /// - Returns: Bool
    @discardableResult
    public static func registerFont(dirPath: String?) -> Bool {
        guard let dirPath = dirPath else { return false }
        guard let fontNames = try? FileManager.default.contentsOfDirectory(atPath: dirPath) else {
            return false
        }
        fontNames.forEach { fontName in
            if fontName.contains(".ttf") || fontName.contains(".otf") {
                registerFont(dirPath: dirPath, fontName: fontName)
            }
        }
        return true
    }
    
    @discardableResult
    /// 注册自定义ttf/otf字体
    /// - Parameters:
    ///   - directoryPath: 字体的文件夹路径
    ///   - fontName: 字体名称
    /// - Returns: Bool
    public static func registerFont(dirPath: String, fontName: String) -> Bool {
        let url = URL(fileURLWithPath: dirPath).appendingPathComponent(fontName)
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            debugPrint("ttf font url error : \(url.absoluteString)")
            return false
        }
        guard let font = CGFont(fontDataProvider) else { return false }
        
        // 加载字体时用postScriptName
        print("font postScriptName: \(font.postScriptName ?? "" as CFString)")
        
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            let message = error.debugDescription
            error?.release()
            debugPrint("ttf font register error: \(message)")
            return false
        }
        return true
    }
}

extension TTFFont {
    
    /// 初始化自定义字体
    /// - Parameters:
    ///   - name: 字体name
    ///   - size: 字体size
    /// - Returns: UIFont
    public static func font(name: String, size: CGFloat) -> UIFont {
        // 只保留1位小数，剩余小数向上取整
        let fontSize = (size * TTFFont.fontScale).roundDown(TTFFont.exactDigit)
        let font = UIFont(name: name, size: fontSize) ?? .systemFont(ofSize: size)
        return font
    }
}

extension CGFloat {
    
    /// 保留decimalDigits位小数  剩余小数丢弃并向下取整
    /// - Parameter num: 保留小数位数
    /// - Returns: 向上取整后的数
    fileprivate func roundDown(_ num: UInt) -> CGFloat {
        let divisor = pow(CGFloat(10.0), CGFloat(num))
        let upValue = floor(CGFloat(self * divisor))
        let result = upValue / divisor
        return result
    }
}

