//
//  SecondViewController.swift
//  TrigonometryCalculator
//
//  Created by Andreas Umbach on 27/07/15.
//  Copyright (c) 2015 Andreas Umbach. All rights reserved.
//

import UIKit

class SASViewController: UIViewController {

    @IBOutlet weak var aValue: UITextField!
    @IBOutlet weak var bValue: UITextField!
    @IBOutlet weak var gammaValue: UITextField!
    @IBOutlet weak var alpha: UILabel!
    @IBOutlet weak var beta: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    
    func setDefaultValues()
    {
        aValue.text = "3.0"
        bValue.text = "4.0"
        gammaValue.text = "90.0"
    }
    
    func updateAlphaBetaGamma()
    {
        let a = NSString(string: aValue.text).doubleValue
        let b = NSString(string: bValue.text).doubleValue
        let gamma = NSString(string: gammaValue.text).doubleValue
        
        if((a <= 0.0) || (b <= 0.0) || (gamma < 0.0) || (gamma > 180.0))
        {
            alpha.text = "undefined"
            beta.text = "undefined"
            cLabel.text = "undefined"
        }
        else
        {
            let cSquared = a * a + b * b - 2 * a * b * cos(gamma / 180.0 * M_PI)
            let c = sqrt( cSquared )
            alpha.text = "\(180.0 / M_PI * acos( ( b*b + c*c - a*a ) / ( 2 * b * c ) ))"
            beta.text = "\(180.0 / M_PI * acos( ( a*a + c*c - b*b ) / ( 2 * a * c ) ))"
            cLabel.text = "\(c)"
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

