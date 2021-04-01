//
//  File.swift
//  客製app
//
//  Created by 簡吟真 on 2021/4/1.
//

// 開一個 file 裝下雪特效，等等用召喚的功能喚醒他

import Foundation
import UIKit

// 設定回傳屬性為 view
func snow() -> UIView{
    
    // 新增一個 view 裝雪花特效
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
    
    // 調整顯示透明度
    view.alpha = 0.7

    let flakeEmitterCell = CAEmitterCell()
    flakeEmitterCell.contents = UIImage(named: "snowFlake")?.cgImage
    flakeEmitterCell.scale = 0.06
    flakeEmitterCell.scaleRange = 0.3
    flakeEmitterCell.emissionRange = .pi
    flakeEmitterCell.lifetime = 20.0
    flakeEmitterCell.birthRate = 20
    flakeEmitterCell.velocity = -30
    flakeEmitterCell.velocityRange = -20
    flakeEmitterCell.yAcceleration = 30
    flakeEmitterCell.xAcceleration = 5
    flakeEmitterCell.spin = -0.5
    flakeEmitterCell.spinRange = 1.0
    
    let snowEmitterLayer = CAEmitterLayer()
    snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
    snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
    snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
    snowEmitterLayer.beginTime = CACurrentMediaTime()
    snowEmitterLayer.timeOffset = 10
    snowEmitterLayer.emitterCells = [flakeEmitterCell]
    
    // 在 view 上添加 下雪特效
    view.layer.addSublayer(snowEmitterLayer)

    // 把 view 的結果傳回 snow()
    return view

}
