//
//  ViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/23.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
// MARK:- 懒加载tableView
    lazy var tableView : UITableView = {
        var table = UITableView()
        table.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height-64)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return table
    }()
    
    lazy var dataArr : [String] = {
        var dataA = ["画线","水波浪","雪花粒子动画", "烟花粒子动画", "火苗效果", "流星动画"]
        return dataA
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "常见动画案例"
        self.view.addSubview(self.tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK:- UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //跳转到指定动画VC
        switch indexPath.row {
        case 0:
            let vc = BezierViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = WaterWaveViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ParticleViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = FireworksViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = FireViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = MeteorViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("我是默认")
        }
    }

}

