//
//  LottieViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/31.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var replayBtn: UIButton!
    
    var animationArr = [String]()
    var animationStr = ""
    
    var animationView : LOTAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationArr = ["LottieLogo1_masked", "9squares-AlBoardman", "HamburgerArrow", "IconTransitions", "LottieLogo1", "LottieLogo2", "MotionCorpse-Jrcanest", "PinJump"];
        
        let temp = Int(arc4random()%(UInt32(animationArr.count)))
        animationStr = animationArr[temp]
        
        contentView.layer.masksToBounds = true
        animationView = LOTAnimationView(name: animationStr)
        animationView.frame = self.contentView.bounds
        animationView.contentMode = .scaleAspectFill
        self.contentView.addSubview(animationView)
        animationView.play{ (finished) in
            // Do Something
        }
        
        
    }
    
    
    @IBAction func rePlay(_ sender: UIButton) {
        animationView.animationProgress = 0
        animationView.play()
    }
    
    
    
    @IBAction func animationClick(_ sender: UIButton) {
        replayBtn.isHidden = false
        animationView.isHidden = false
        textView.isHidden = true
        textView.resignFirstResponder()
        
        let temp = Int(arc4random()%(UInt32(animationArr.count)))
        animationStr = animationArr[temp]
        
        animationView.removeFromSuperview()
        animationView = nil
        animationView = LOTAnimationView(name: animationStr)
        animationView.frame = self.contentView.bounds
        animationView.contentMode = .scaleAspectFill
        self.contentView.addSubview(animationView)
        animationView.play{ (finished) in
            // Do Something
        }
    }
    
    
    @IBAction func typeClick(_ sender: UIButton) {
        replayBtn.isHidden = true
        animationView.isHidden = true
        textView.isHidden = false
        textView.becomeFirstResponder()
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
