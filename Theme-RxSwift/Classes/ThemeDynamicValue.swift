//
//  ThemeDynamicValue.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/5.
//

import RxSwift

/// 动态值
public struct ThemeDynamicValue<Property> {
    
    /// 发生改变时的观察者
    public var observable: Observable<String>
    
    /// 改变时的动态回调
    public var dynamicValue: (() -> Property)
}
