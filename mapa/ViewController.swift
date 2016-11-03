//
//  ViewController.swift
//  mapa
//
//  Created by Użytkownik Gość on 26.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    
    
    @IBAction func Start(sender: AnyObject) {
        StartButton.enabled = false
        StopButton.enabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartButton.enabled = true
        StopButton.enabled = false
        ClearButton.enabled = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

