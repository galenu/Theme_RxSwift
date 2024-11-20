//
//  ThemeService.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/6.
//

import Foundation
import RxSwift
import RxRelay

public struct ThemeService {
    
    private let subject = BehaviorRelay(value: "")
    
    public var observable: Observable<String> {
        return self.subject.asObservable()
    }
        
    public init() { }

    /// create ThemeDynamicValue
    public func dynamicValue<Property>(_ dynamicValue: @escaping (() -> Property)) -> ThemeDynamicValue<Property> {
        return ThemeDynamicValue(observable: self.observable, dynamicValue: dynamicValue)
    }
    
    public func switchTheme(_ value: String) {
        self.subject.accept(value)
    }
}
