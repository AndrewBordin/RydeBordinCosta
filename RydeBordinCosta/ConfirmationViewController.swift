//
//  ConfirmationViewController.swift
//  RydeBordinCosta
//
//  Created by Luiz Fernando Costa on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var txtFromLocation: UILabel!
    @IBOutlet weak var txtToLocation: UILabel!
    @IBOutlet weak var txtTotalPrice: UILabel!
    @IBOutlet weak var txtServiceFee: UILabel!
    @IBOutlet weak var txtDistanceCharge: UILabel!
    @IBOutlet weak var txtBookingFeePrice: UILabel!
    
    var fromLocation:String = ""
    var toLocation:String = ""
    var totalPrice:Double = 0
    var serviceFee:Double = 0
    var distanceCharge:Double = 0
    var bookingFeePrice:Double = 0
    
    func roundNumber(x:Double) -> String{
        let roundedNumber = String(format:"$ %.2f", x)
        return roundedNumber
    }
    
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
