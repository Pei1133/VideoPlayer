//
//  ViewController.swift
//  VideoPlayer
//
//  Created by 黃珮鈞 on 2018/1/19.
//  Copyright © 2018年 黃珮鈞. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {

    let videoViewController = VideoViewController()
    var url: String = ""
    var isPlaying = true
    let enterURLTextField = UITextField(frame: CGRect(x: 8, y: 27, width: 359, height: 30))
    
    let pausePlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pause", for: .normal)
        button.tintColor = UIColor.white
        button.frame = CGRect(x: 20, y: 636, width: 55, height: 19)
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePause(){
        if videoViewController.play == true {
            videoViewController.play = false
        } else {
            videoViewController.play = true
        }
//        if isPlaying {
////            print("pause!")
////            player?.pause()
//            pausePlayButton.setTitle("Play", for: .normal)
//        } else {
////            print("play!")
////            player?.play()
//            pausePlayButton.setTitle("Pause", for: .normal)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(pausePlayButton)
        
        setupTextField()
//        setupPlayerView()
    }
    
    
//    var player: AVPlayer?
//    func setupPlayerView(){
//
//        let urlString = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
//        guard let videoURL = NSURL(string: urlString) else { fatalError("連接錯誤") }
//
//        player = AVPlayer(url: videoURL as URL)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player?.play()
    
//        player?.addObserver(self, forKeyPath: "play", options: .new, context: nil)
//        player?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
//        let playerItem = AVPlayerItem(url: videoURL as URL)
//        playerItem.addObserver(self, forKeyPath: "url", options: .new, context: nil)
        
//    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        
//        if keyPath == "status" {
//            
//            print("AAA")
//            guard let newChange = change?[.newKey] as? Bool else{return}
//            if newChange == true{
//                player?.play()
//            } else {
//                player?.pause()
//            }
//        }
//
//    }
    
    func setupTextField(){
        
        self.enterURLTextField.delegate = self
        
        self.view.addSubview(enterURLTextField)
        
        self.enterURLTextField.placeholder = "Enter URL of video"
        
        self.enterURLTextField.borderStyle = .roundedRect
        
        self.enterURLTextField.clearButtonMode = .whileEditing
        
        self.enterURLTextField.keyboardType = .emailAddress
        
        self.enterURLTextField.returnKeyType = .done
        
        self.enterURLTextField.backgroundColor = UIColor.white
        
        self.enterURLTextField.textColor = UIColor.black

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
 
        self.view.endEditing(true)
        
        self.url = self.enterURLTextField.text!
        
        return true
    }
}
