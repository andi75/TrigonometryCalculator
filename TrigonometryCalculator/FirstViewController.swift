//
//  FirstViewController.swift
//  TrigonometryCalculator
//
//  Created by Andreas Umbach on 27/07/15.
//  Copyright (c) 2015 Andreas Umbach. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var aValue: UITextField!
    @IBOutlet weak var bValue: UITextField!
    @IBOutlet weak var cValue: UITextField!

    @IBOutlet weak var alpha: UILabel!
    @IBOutlet weak var beta: UILabel!
    @IBOutlet weak var gamma: UILabel!
    
    func setDefaultValues()
    {
        aValue.text = "3.0"
        bValue.text = "4.0"
        cValue.text = "5.0"
    }
    
    func updateAlphaBetaGamma()
    {
        let a = NSString(string: aValue.text).doubleValue
        let b = NSString(string: bValue.text).doubleValue
        let c = NSString(string: cValue.text).doubleValue
        
        if((a <= 0.0) || (b <= 0.0) || (c <= 0.0) || (a + b < c) || (a + c < b) || (b + c < a))
        {
            alpha.text = "undefined"
            beta.text = "undefined"
            gamma.text = "undefined"
        }
        else
        {
            alpha.text = "\(180.0 / M_PI * acos( ( b*b + c*c - a*a ) / ( 2 * b * c ) ))"
            beta.text = "\(180.0 / M_PI * acos( ( a*a + c*c - b*b ) / ( 2 * a * c ) ))"
            gamma.text = "\(180.0 / M_PI * acos( ( a*a + b*b - c*c ) / ( 2 * a * b ) ))"
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

