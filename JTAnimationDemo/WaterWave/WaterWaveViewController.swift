//
//  WaterWaveViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/23.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit
/**
 正弦型函数解析式：y=Asin（ωx+φ）+h
 各常数值对函数图像的影响：
 φ（初相位）：决定波形与X轴位置关系或横向移动距离（左加右减）
 ω：决定周期（最小正周期T=2π/|ω|）
 A：决定峰值（即纵向拉伸压缩的倍数）
 h：表示波形在Y轴的位置关系或纵向移动距离（上加下减）
 */
class WaterWaveViewController: UIViewController {

    lazy var waveDisplaylink = CADisplayLink()
    
    lazy var firstWaveLayer = CAShapeLayer()
    
    lazy var secondWaveLayer = CAShapeLayer()
    
    var firstWaveColor: UIColor?
    
    /// 水纹振幅
    var waveA: CGFloat = 10
    
    /// 水纹周期
    var waveW: CGFloat = 1/30.0;
    
    /// 位移
    var offsetX: CGFloat = 0
    
    /// 当前波浪高度Y
    var currentK: CGFloat = 0
    
    /// 水纹速度
    var waveSpeed: CGFloat = 0
    
    /// 水纹路宽度
    var waterWaveWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 34/255.0, blue: 85/255.0, alpha: 1)
        self.view.layer.masksToBounds = true
        
        
        setUpUI()
        
    }
    
    
    func setUpUI () {
        
        // 波浪宽
        waterWaveWidth = self.view.bounds.size.width
        // 波浪颜色
        firstWaveColor = UIColor.green
        // 波浪速度
        waveSpeed = 0.4 / CGFloat(M_PI)
        // 设置闭环的颜色
        firstWaveLayer.fillColor = UIColor.init(colorLiteralRed: 73/255.0, green: 142/255.0, blue: 178/255.0, alpha: 0.5).cgColor
        // 设置边缘线的颜色
        //        firstWaveLayer.strokeColor = UIColor.blue.cgColor
        firstWaveLayer.strokeStart = 0.0
        firstWaveLayer.strokeEnd = 0.8
        // 设置闭环的颜色
        secondWaveLayer.fillColor = UIColor.init(colorLiteralRed: 73/255.0, green: 142/255.0, blue: 178/255.0, alpha: 0.5).cgColor
        // 设置边缘线的颜色
        //        secondWaveLayer.strokeColor = UIColor.blue.cgColor
        secondWaveLayer.strokeStart = 0.0
        secondWaveLayer.strokeEnd = 0.8
        self.view.layer.addSublayer(firstWaveLayer)
        self.view.layer.addSublayer(secondWaveLayer)
        
        // 设置波浪流动速度
        waveSpeed = 0.05
        // 设置振幅
        waveA = 8
        // 设置周期
        waveW = 2 * CGFloat(M_PI) / self.view.bounds.size.width
        // 设置波浪纵向位置
        currentK = self.view.bounds.size.height / 2 //屏幕居中
        
        waveDisplaylink = CADisplayLink(target: self, selector: #selector(getCurrentWave))
        waveDisplaylink.add(to: RunLoop.current, forMode: .commonModes)
        
    }
    
    
    @objc private func getCurrentWave(disPlayLink: CADisplayLink) {
        // 实时位移
        offsetX += waveSpeed
        setCurrentFirstWaveLayerPath()
    }
    
    private func setCurrentFirstWaveLayerPath() {
        // 创建一个路径
        let path = CGMutablePath()
        var y = currentK
        path.move(to: CGPoint(x: 0, y: y))
        
        for i in 0...Int(waterWaveWidth) {
            y = waveA * sin(waveW * CGFloat(i) + offsetX) + currentK
            path.addLine(to: CGPoint(x: CGFloat(i), y: y))
        }
        
        path.addLine(to: CGPoint(x: waterWaveWidth, y: self.view.bounds.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.view.bounds.size.height))
        path.closeSubpath()
        firstWaveLayer.path = path
        
        // 创建一个路径
        let path2 = CGMutablePath()
        var y2 = currentK
        path2.move(to: CGPoint(x: 0, y: y))
        
        for i in 0...Int(waterWaveWidth) {
            y2 = waveA * sin(waveW * CGFloat(i) + offsetX - waterWaveWidth/2 ) + currentK
            path2.addLine(to: CGPoint(x: CGFloat(i), y: y2))
        }
        
        path2.addLine(to: CGPoint(x: waterWaveWidth, y: self.view.bounds.size.height))
        path2.addLine(to: CGPoint(x: 0, y: self.view.bounds.size.height))
        path2.closeSubpath()
        secondWaveLayer.path = path2
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
