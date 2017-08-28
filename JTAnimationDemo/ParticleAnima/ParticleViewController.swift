//
//  ParticleViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/23.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit

class ParticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 34/255.0, blue: 85/255.0, alpha: 1)
        
//        //1 流星
//        let emitter = CAEmitterLayer()
//        emitter.frame = CGRect(x: 350, y: 100, width: 50, height: 50)
//        view.layer.addSublayer(emitter)
//        
//        
//        //1.1 属性设置
//        emitter.emitterShape = kCAEmitterLayerLine //直线
//        emitter.emitterPosition = CGPoint(x: emitter.frame.size.width/2, y: emitter.frame.size.height/2) //决定了粒子发射形状的中心点
//        emitter.emitterSize = CGSize(width: 5, height: 5)//决定了粒子发射形状的大小
//        
//        let cell = CAEmitterCell()
//        cell.color = UIColor.white.cgColor
//        cell.lifetime = 5
//        cell.birthRate = 2
//        
//        emitter.emitterCells = [cell]
        
        snowAnimation()
        
    }
    
    
    /// //雪花动画
    func snowAnimation() {
        
        //粒子发射器
        let snowEmitter = CAEmitterLayer()
        //粒子发射的位置
        snowEmitter.emitterPosition = CGPoint(x: 100, y: 30)
        //发射源的大小
        snowEmitter.emitterSize = CGSize(width: self.view.bounds.size.width, height: 0)
        //发射模式
        snowEmitter.emitterMode = kCAEmitterLayerOutline
        //发射源的形状
        snowEmitter.emitterShape = kCAEmitterLayerLine
                
        //创建雪花粒子
        let cell = CAEmitterCell()
        //粒子的名称
        cell.name = "snow"
        //粒子参数的速度乘数因子。越大出现的越快
        cell.birthRate = 1.0
        //存活时间
        cell.lifetime = 120.0
        //粒子速度
        cell.velocity = -10
        //粒子速度范围
        cell.velocityRange = 10
        //粒子y方向的加速度分量
        cell.yAcceleration = 3
        //周围发射角度
        cell.emissionRange = CGFloat(0.5 * M_PI)
        //粒子旋转角度范围
        cell.spinRange = CGFloat(0.25 * Double.pi)
        //粒子图片
        cell.contents = UIImage.init(named: "snow")?.cgImage
        //粒子颜色
        cell.color = UIColor.white.cgColor
        
        //设置阴影
        snowEmitter.shadowOpacity = 1.0
        snowEmitter.shadowRadius = 0.0
        snowEmitter.shadowOffset = CGSize(width: 0.0, height: 1.0)
        snowEmitter.shadowColor = UIColor.white.cgColor
            
        // 将粒子添加到粒子发射器上
        snowEmitter.emitterCells = [cell]
        
        self.view.layer .addSublayer(snowEmitter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
