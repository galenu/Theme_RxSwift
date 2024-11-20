//
//  UIKit+Theme.swift
//  RxSwiftTheme
//
//  Created by CNCEMN188807 on 2024/11/6.
//

import RxSwift
import NSObject_Rx

extension ThemeWrapper where Base: UIButton {
    
    public func setTitleColor(_ value: ThemeDynamicValue<UIColor>, for state: UIControl.State) {
        value.observable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak base] _ in
                base?.setTitleColor(value.dynamicValue(), for: state)
            }).disposed(by: self.base.rx.disposeBag)
    }
    
    public func setImage(_ value: ThemeDynamicValue<UIImage>, for state: UIControl.State) {
        value.observable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak base] _ in
                base?.setImage(value.dynamicValue(), for: state)
            }).disposed(by: self.base.rx.disposeBag)
    }
    
    public func setBackgroundImage(_ value: ThemeDynamicValue<UIImage>, for state: UIControl.State) {
        value.observable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak base] _ in
                base?.setBackgroundImage(value.dynamicValue(), for: state)
            }).disposed(by: self.base.rx.disposeBag)
    }
}

