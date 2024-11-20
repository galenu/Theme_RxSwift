//
//  HomeController.swift
//  RxSwiftTheme_Example
//
//  Created by CNCEMN188807 on 2024/11/6.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.theme.backgroundColor = .color(\.bgPage)
    }
    
    
    @IBAction func changeTheme(_ sender: Any) {
        HMTheme.shared.switchTheme(HMTheme.shared.themeType == .light ? .dark : .light)
    }
    
}
