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
    @IBOutlet weak var tfRana: UILabel!
    @IBOutlet weak var viBottomView: UIView!
    
    @IBAction func slBar(_ sender: UISlider) {
        let currentValue = sender.value
        let xPosition = CGFloat(currentValue) * viTopView.bounds.width
        
        imgBall.frame = CGRect(x: xPosition, y: imgBall.frame.origin.y, width: imgBall.frame.size.width, height: imgBall.frame.size.height)
    }
    
    @IBAction func animarLetrero(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 1, animations: {
                self.tfRana.frame.origin.x = 50
            })
        case 1:
            UIView.animate(withDuration: 1, animations: {
                self.tfRana.frame.origin.x = 300
            })
        default:
            break
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

