//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Luo on 6/2/16.
//  Copyright © 2016 Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rect: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.animation()
    }
    @IBAction func btnReplay(sender: AnyObject) {
        self.animation()
    }
    
    private func animation() {
        let width = self.view.frame.width - self.rect.frame.width
        let height = self.view.frame.height
        
        let animationX = CABasicAnimation()
        animationX.keyPath = "position.x"
        animationX.fromValue = 0
        animationX.toValue = width
        animationX.duration = 5.0
        animationX.additive = true
        
        let animationY = TFBasicAnimation()
        animationY.keyPath = "position.y"
        animationY.fromValue = 0
        animationY.byValue = height / 4
        animationY.duration = 5.0
        animationY.additive = true
        animationY.timeFunction = TFEasingFunctionEaseSin(2)
        let group = CAAnimationGroup()
        group.animations = [animationX,animationY]
        group.duration = 5.0
        group.beginTime = 0.0
        
        self.rect.layer.addAnimation(group, forKey: "TF")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



