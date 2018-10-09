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
    
    let baseFare:Double = 2.50
    let perKmCharge:Double = 0.81
    let serviceFees:Double = 1.75
    let minimumFee:Double = 4.64
    
    let SheridanToBrampton:Double = 40.70
    let SheridanToBoot:Double = 4.8
    
    var amtKm:Double = 0
    
    var totalPrice:Double = 0
    
    

    
    
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
        
        let page2 = segue.destination as! ConfirmationViewController
        page2.fromLocation = fromLocation
        page2.toLocation = toLocation
        page2.totalPrice = totalPrice
        page2.serviceFee = serviceFees
        page2.distanceCharge = amtKm*perKmCharge
        page2.bookingFeePrice = baseFare
        
        
    }

    @IBAction func btnFindRide(_ sender: Any) {
        
        if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "Sheridan Brampton"){
            amtKm = SheridanToBrampton
        }
        
        else if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "The Boot Social") {
            amtKm = SheridanToBoot
        }
        
        else {
            print("invalid location")
        }
        
        totalPrice = baseFare + (amtKm * perKmCharge) + serviceFees
        
        if (totalPrice < minimumFee) {
            totalPrice = minimumFee
        }
        
        //TODO: SURGE PRICING
        //TODO: RydePOOl Rates

    }
}

