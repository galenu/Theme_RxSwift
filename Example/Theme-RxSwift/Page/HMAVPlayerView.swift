//
//  HMAVPlayerView.swift
//  jbl_partylight_ios
//
//  Created by CNCEMN188807 on 2024/3/25.
//

import UIKit
import AVKit

@IBDesignable

/// mp4动画播放View
public class HMAVPlayerView: UIView {
    
    var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var playerLayer: AVPlayerLayer?
    
    /// 是否重复播放
    public var isRepeat: Bool = true
        
    public var playToEndAction: (()-> Void)?
    
    public init() {
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = self.bounds
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        try? AVAudioSession.sharedInstance().setActive(false, options: [.notifyOthersOnDeactivation])
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPlayToEndTime), name: AVPlayerItem.didPlayToEndTimeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    /// 初始化mp4动画播放View
    /// - Parameter name: mp4文件名称，带后缀
    public func play(name: String) {
        
        self.theme.changed = .theme({ [weak self] in
            guard let `self` = self else { return }
            
            guard let url = URL.url(forResource: name) else { return }
            self.playerItem = AVPlayerItem(url: url)
            self.player = AVPlayer(playerItem: self.playerItem)
            let playerLayer = AVPlayerLayer(player: self.player)
            self.playerLayer = playerLayer
            playerLayer.videoGravity = .resizeAspectFill
            self.layer.addSublayer(playerLayer)
            self.play()
        })
    }
    
    public func play() {
        player?.play()
    }
    
    public func pause() {
        player?.pause()
    }
    
    public func currentTime() -> Double? {
        return self.playerItem?.currentTime().seconds
    }
    
    /// 播放结束,重新播放
    @objc private func didPlayToEndTime() {
        self.playToEndAction?()
        if self.isRepeat {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
                guard let `self` = self else { return }
                self.playerItem?.seek(to: CMTime.zero) { [weak self] _ in
                    guard let `self` = self else { return }
                    self.player?.play()
                }
            }
        }
    }
    
    @objc private func didEnterBackground() {
        self.pause()
    }
    
    @objc private func willEnterForeground() {
        self.play()
    }
}

