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

    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black

        setupTextField()
        
//        "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        guard let videoURL = NSURL(string: url) else { fatalError("連接錯誤") }
//        let filePath = Bundle.main.path(forResource: "hangge", ofType: "mp4")
//        let videoURL = URL(fileURLWithPath: filePath!)

        let player = AVPlayer(url: videoURL as URL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func setupTextField(){
        
        let enterURLTextField = UITextField(frame: CGRect(x: 8, y: 27, width: 359, height: 30))
        
        enterURLTextField.delegate = self
        
        self.view.addSubview(enterURLTextField)
        
        enterURLTextField.placeholder = "Enter URL of video"
        
        enterURLTextField.borderStyle = .roundedRect
        
        enterURLTextField.clearButtonMode = .whileEditing
        
        enterURLTextField.keyboardType = .emailAddress
        
        enterURLTextField.returnKeyType = .done
        
        enterURLTextField.backgroundColor = UIColor.white
        
        enterURLTextField.textColor = UIColor.black
        
        self.url = enterURLTextField.text!

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
 
        self.view.endEditing(true)
        
        return true
    }

}

