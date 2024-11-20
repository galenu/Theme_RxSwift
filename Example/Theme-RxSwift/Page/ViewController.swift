//
//  ViewController.swift
//  RxSwiftTheme
//
//  Created by galenu on 11/05/2024.
//  Copyright (c) 2024 galenu. All rights reserved.
//

import UIKit
import Theme_RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var wtiteThemeBtn: UIButton!
    
    @IBOutlet weak var blackThemeBtn: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var playerView: HMAVPlayerView!
    
    deinit {
        print("ViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme.backgroundColor = .color(\.bgPage)
        
        view.theme.changed = .theme({

            print("主题改变: \(HMTheme.shared.themeType)")
            
            if let lottie_wifi_connect = URL.url(forResource: "lottie_wifi_connect.json") {
                print("lottie_wifi_connect: \(lottie_wifi_connect.absoluteString)")
            }
            
            if let video_welcome_placeholder = URL.url(forResource: "video_welcome_placeholder.mp4") {
                print("video_welcome_placeholder: \(video_welcome_placeholder.absoluteString)")
            }
        })
        
        playerView.play(name: "video_welcome_placeholder.mp4")
        
        wtiteThemeBtn.theme.backgroundColor = .color(\.buttonDisableBg)
        wtiteThemeBtn.theme.setTitleColor(.color(\.buttonDisableTitle), for: .normal)
        
        blackThemeBtn.theme.backgroundColor = .color(\.buttonNormalBg)
        blackThemeBtn.theme.setTitleColor(.color(\.buttonNormalTitle), for: .normal)
        
        imageView.theme.image = .image(named: "base/logo")
        
        label.theme.textColor = .color(\.textMajor)
        label.text = "测试的主题标题label"
        
        label.theme.font = .font(\.title1)
        
        btn.theme.backgroundColor = .color(\.buttonNormalBg)
        btn.theme.setTitleColor(.color(\.textMinor), for: .normal)
        btn.titleLabel?.theme.font = .font(\.title2)
        btn.setTitle("测试的主题按钮Button", for: .normal)
        
    }

    @IBAction func whiteThemeBtnClick(_ sender: Any) {
        HMTheme.shared.switchTheme(.light)
    }
    
    @IBAction func blackThemeBtnClick(_ sender: Any) {
        HMTheme.shared.switchTheme(.dark)
    }
}

