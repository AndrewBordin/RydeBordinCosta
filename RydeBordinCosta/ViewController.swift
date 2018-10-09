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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let fromLocation = txtFromLocation.text!
        let toLocation = txtToLocation.text!
        
        // 2. SET the placeholder variable in page 2
        // 2a. get an object reference of the 2nd page
        // 2b. set the placeholder variable
        
        let page2 = segue.destination as! ConfirmationViewController
        page2.fromLocation = fromLocation
        page2.toLocation = toLocation
        page2.totalPrice = ""
        page2.serviceFee = ""
        page2.distanceCharge = ""
        page2.bookingFeePrice = ""
        
        
        //HomeScreenViewController page2 = (HomeScreenViewController) segue.destination;
        //page2.username = data;
        
        
        
        
        
        // 3. DONE!
        
    }

    @IBAction func btnFindRide(_ sender: Any) {
        print("test btnFindRide")
    }
}

