//
//  ConfirmationViewController.swift
//  RydeBordinCosta
//
//  Created by Andrew Bordin & Luiz Fernando Costa on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    //Declaration of UI Variables
    @IBOutlet weak var txtFromLocation: UILabel!
    @IBOutlet weak var txtToLocation: UILabel!
    @IBOutlet weak var txtTotalPrice: UILabel!
    @IBOutlet weak var txtServiceFee: UILabel!
    @IBOutlet weak var txtDistanceCharge: UILabel!
    @IBOutlet weak var txtBookingFeePrice: UILabel!
    
    //Set up variables and constants
    var fromLocation:String = ""
    var toLocation:String = ""
    var totalPrice:Double = 0
    var serviceFee:Double = 0
    var distanceCharge:Double = 0
    var bookingFeePrice:Double = 0
    
    //Rounding function to round numbers to 2 decimal places
    func roundNumber(x:Double) -> String{
        let roundedNumber = String(format:"$ %.2f", x)
        return roundedNumber
    }
    
    //Getting the values that were sent through the segue
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFromLocation.text = fromLocation
        txtToLocation.text = toLocation
        txtTotalPrice.text = roundNumber(x:totalPrice)
        txtServiceFee.text = roundNumber(x:serviceFee)
        txtDistanceCharge.text = roundNumber(x:distanceCharge)
        txtBookingFeePrice.text = roundNumber(x:bookingFeePrice)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
