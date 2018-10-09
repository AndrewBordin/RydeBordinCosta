//
//  ViewController.swift
//  RydeBordinCosta
//
//  Created by Andrew Bordin on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtFromLocation: UITextField!
    @IBOutlet weak var txtToLocation: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnFindRide(_ sender: Any) {
        print("test btnFindRide")
    }
}

