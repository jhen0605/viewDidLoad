//
//  ViewController.swift
//  客製app
//
//  Created by 簡吟真 on 2021/4/1.
//

import UIKit
import SpriteKit
import AVFoundation



class ViewController: UIViewController {
    let player = AVPlayer()   //音樂（程式法在下方）
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.25)
        gradientLayer.colors = [
            UIColor(red: 149/255, green: 125/255, blue: 173/255, alpha: 1).cgColor,
            UIColor(red: 210/255, green: 145/255, blue: 188/255, alpha: 1).cgColor,
            UIColor(red: 254/255, green: 200/255, blue: 216/255, alpha: 1).cgColor,
            UIColor(red: 210/255, green: 145/255, blue: 188/255, alpha: 1).cgColor,
            UIColor(red: 149/255, green: 125/255, blue: 173/255, alpha: 1).cgColor,
        ]
        view.layer.addSublayer(gradientLayer)
    
        
        //gif動畫
        let ImageView = UIImageView(frame: CGRect(x: 50, y: 550, width: 320, height: 270))
        let animatedImage = UIImage.animatedImageNamed("gif-", duration: 6)
        ImageView.image = animatedImage
        let flowerImageView = UIImageView(frame: CGRect(x: -40, y: -60, width: 500, height: 500))
        let flowerAnimatedImage = UIImage.animatedImageNamed("flower-", duration: 5)
        flowerImageView.image = flowerAnimatedImage
        //CGAffineTransform: scale縮放及鏡像翻轉
        ImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

        
        //愛心雪花
        let snowEmitterCell = CAEmitterCell()
        snowEmitterCell.contents = UIImage(named: "love")?.cgImage
        snowEmitterCell.birthRate = 4
        snowEmitterCell.lifetime = 15
        snowEmitterCell.velocity = 100
        snowEmitterCell.scale = 0.2
        snowEmitterCell.scaleRange = 0.03
        snowEmitterCell.spin = 0.5
        snowEmitterCell.spinRange = 1
        snowEmitterCell.yAcceleration = 30
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterCells = [snowEmitterCell]
        
        
        //愛心雪花路徑
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .line
        view.addSubview(ImageView)
        view.layer.addSublayer(snowEmitterLayer)
        view.addSubview(flowerImageView)
        
        
        //音樂
        let fileUrl = Bundle.main.url(forResource: "music", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
   
  }
}
