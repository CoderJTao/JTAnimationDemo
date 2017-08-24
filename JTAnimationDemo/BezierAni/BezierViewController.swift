//
//  BezierViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/23.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit

class BezierViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 50, y: 100))
        bezierPath.addLine(to: CGPoint(x: 325, y: 100))
        bezierPath.addLine(to: CGPoint(x: 80, y: 250))
        bezierPath.addLine(to: CGPoint(x: 275, y: 250))
        bezierPath.addLine(to: CGPoint(x: self.view.frame.width/2.0, y: 220))
        bezierPath.addLine(to: CGPoint(x: self.view.frame.width/2.0, y: 400))
        bezierPath.addLine(to: CGPoint(x: 30, y: 400))
        bezierPath.addLine(to: CGPoint(x: 345, y: 400))
        
        //画线
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = bezierPath.cgPath
        view.layer.addSublayer(shapeLayer)
        
        let pathAnim = CABasicAnimation(keyPath: "strokeEnd")
        pathAnim.duration = 5.0
        pathAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnim.fromValue = 0//开始
        pathAnim.toValue = 1//到100%
        pathAnim.autoreverses = true// 动画按原路径返回
        pathAnim.fillMode = kCAFillModeForwards
        //        pathAnim.isRemovedOnCompletion = false
        pathAnim.repeatCount = Float.infinity
        shapeLayer.add(pathAnim, forKey: "strokeEndAnim")
        
        
        //视图沿路径移动
        let moveV = UIImageView.init(image: UIImage.init(named: ""))
        moveV.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        moveV.backgroundColor = UIColor.red
        moveV.center = CGPoint(x: 50, y: 100)
        view.addSubview(moveV)
        
        let keyAnima = CAKeyframeAnimation.init(keyPath: "position")
//        keyAnima.delegate = self
        keyAnima.duration = 5.0
        keyAnima.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        keyAnima.path = bezierPath.cgPath
        keyAnima.fillMode = kCAFillModeForwards//动画开始之后layer的状态将保持在动画的最后一帧，而removedOnCompletion的默认属性值是 YES，所以为了使动画结束之后layer保持结束状态，应将removedOnCompletion设置为NO
        keyAnima.isRemovedOnCompletion = false
        moveV.layer.add(keyAnima, forKey: "moveAnimation")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
