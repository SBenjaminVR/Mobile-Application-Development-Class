//
//  ViewController.swift
//  UI View Practice
//
//  Created by Fabiola Valdez on 2/17/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgBall: UIImageView!
    @IBOutlet weak var viTopView: UIView!
    
    @IBAction func slBar(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        let xPosition = currentValue * viTopView.frame.width
        
        imgBall.frame = CGRect(x: xPosition, y: imgBall.frame.origin.y, width: imgBall.frame.size.width, height: imgBall.frame.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

