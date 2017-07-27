//
//  ViewController.swift
//  sample_app
//
//  Created by sweetiewill on 7/26/17.
//  Copyright © 2017 brewinglab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var aButton: UIButton!
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBAction func aButtonTapped(_ sender: UIButton) {
        if(aButton.alpha == 1)
        {
            aButton.alpha = 0
        }
    }
    
    @IBAction func bButtonTapped(_ sender: UIButton) {
        if(bButton.alpha == 1)
        {
            bButton.alpha = 0
        }
    }
    
    
    @IBAction func cButtonTapped(_ sender: UIButton) {
        if(cButton.alpha == 1)
        {
            cButton.alpha = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

