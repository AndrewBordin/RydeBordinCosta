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
    var totalPrice:String = ""
    var serviceFee:String = ""
    var distanceCharge:String = ""
    var bookingFeePrice:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFromLocation.text = fromLocation
        txtToLocation.text = toLocation
        txtTotalPrice.text = totalPrice
        txtServiceFee.text = serviceFee
        txtDistanceCharge.text = distanceCharge
        txtBookingFeePrice.text = bookingFeePrice

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
