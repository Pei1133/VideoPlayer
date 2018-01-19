//
//  VideoViewController.swift
//  VideoPlayer
//
//  Created by 黃珮鈞 on 2018/1/19.
//  Copyright © 2018年 黃珮鈞. All rights reserved.
//

import UIKit
import Foundation
import AVKit

class VideoViewController: AVPlayerViewController {

    @objc dynamic var play: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver(self, forKeyPath: "play", options: .new, context: nil)
        setupPlayerView()
    }
    
//    var player: AVPlayer?
    func setupPlayerView(){

        let urlString = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        guard let videoURL = NSURL(string: urlString) else { fatalError("連接錯誤") }

        let player = AVPlayer(url: videoURL as URL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()

//        player?.addObserver(self, forKeyPath: "status", options: .new, context: nil)


    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "play" {
            
            print("AAA")
            guard let newChange = change?[.newKey] as? Bool else{return}
            if newChange == true{
                player?.play()
            } else {
                player?.pause()
            }
        }
    }
}
