//
//  ThemeWrapper.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/5.
//
import Foundation
import RxSwift

public protocol ThemeCompatible {
    associatedtype CompatibleType
    var theme: ThemeWrapper<CompatibleType> { get }
}

extension ThemeCompatible {
    public var theme: ThemeWrapper<Self> {
        return ThemeWrapper(self)
    }
}

extension NSObject: ThemeCompatible {}

@dynamicMemberLookup
public class ThemeWrapper<Base> {
        
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}
