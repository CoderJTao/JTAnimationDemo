//
//  MeteorViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/28.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit

class MeteorViewController: UIViewController {

    var timer : Timer!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
        timer.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 34/255.0, blue: 85/255.0, alpha: 1)

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(liuXingAnimation), userInfo: nil, repeats: true)
    }
    
    func liuXingAnimation() {
        let rect    = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.height, width: 100, height: 100)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        self.view.layer.addSublayer(emitter)
        emitter.renderMode   = kCAEmitterLayerAdditive//合并粒子重叠部分的亮度使得看上去更亮
        emitter.emitterPosition     = CGPoint(x: rect.width/2, y:rect.height/2)
        let            cell  = CAEmitterCell()
        let           image  = UIImage(named: "liuxing")!
        cell.contents        = image.cgImage
        cell.birthRate       = 500 //每秒产生150个粒子
        cell.lifetime        = 5.0
        cell.color           = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        
        cell.alphaSpeed      = -0.6//粒子的透明度每过一秒就减少0.4
        
        cell.velocity        = 50
        cell.velocityRange   = 20   //初始速度值变化的范围 30 ~ 70
        cell.emissionLongitude = CGFloat(-Double.pi/2/180*45)//向上（x-y平面的发射方向）
        cell.emissionRange   = CGFloat(Double.pi/2/180)//围绕发射方向的弧度数
        cell.scale           = 0.2
        emitter.emitterCells = [cell]
        self.view.layer.addSublayer(emitter)
        
        let aPath = UIBezierPath()
        let height : UInt32 = UInt32(self.view.bounds.height-50)
        let randomY = CGFloat(arc4random()%height)
        
        aPath.move(to: CGPoint(x: self.view.bounds.width, y: randomY))
        aPath.addLine(to: CGPoint(x: -100, y: self.view.bounds.width/2+randomY))
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 5;
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.repeatCount = 1
        animation.path = aPath.cgPath
        //        animation.calculationMode = kCAAnimationPaced
        animation.setValue("liuxing", forKey: "liuxing")
        //                animation.rotationMode = kCAAnimationRotateAutocell
        emitter.add(animation, forKey: "moveTheSquare")
//        animation.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
