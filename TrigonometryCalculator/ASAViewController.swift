//
//  ASAViewController.swift
//  TrigonometryCalculator
//
//  Created by Andreas Umbach on 29/07/15.
//  Copyright (c) 2015 Andreas Umbach. All rights reserved.
//

import UIKit

class ASAViewController : UIViewController
{
    @IBOutlet weak var alphaValue: UITextField!
    @IBOutlet weak var betaValue: UITextField!
    @IBOutlet weak var cValue: UITextField!
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var gammaLabel: UILabel!
    
    func setDefaultValues()
    {
        alphaValue.text = "30.0"
        betaValue.text = "60.0"
        cValue.text = "2.0"
    }
    
    func updateAlphaBetaGamma()
    {
        let alpha = NSString(string: alphaValue.text).doubleValue
        let beta = NSString(string: betaValue.text).doubleValue
        let c = NSString(string: cValue.text).doubleValue
        
        if((c <= 0.0) || (alpha <= 0.0) || (beta < 0.0) || (alpha + beta > 180.0))
        {
            aLabel.text = "undefined"
            bLabel.text = "undefined"
            gammaLabel.text = "undefined"
        }
        else
        {
            let gamma = 180 - alpha - beta
            gammaLabel.text = "\(gamma)"
            aLabel.text = "\(c * sin(alpha * M_PI / 180.0) / sin(gamma * M_PI / 180.0))"
            bLabel.text = "\(c * sin(beta * M_PI / 180.0) / sin(gamma * M_PI / 180.0))"
        }
    }
    
    
    @IBAction func editingChanged() {
        updateAlphaBetaGamma()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultValues()
        updateAlphaBetaGamma()
    }
}
