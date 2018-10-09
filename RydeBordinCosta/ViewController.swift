//
//  ViewController.swift
//  RydeBordinCosta
//
//  Created by Andrew Bordin on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    let baseFare:Double = 2.50
    let perKmCharge:Double = 0.81
    let serviceFees:Double = 1.75
    let minimumFee:Double = 4.64
    
    let SheridanToBrampton:Double = 40.70
    let SheridanToBoot:Double = 4.8
    var rydePoolRate:Double = 1.00
    var surgeHourRate:Double = 1.00
    
    var amtKm:Double = 0
    
    var totalPrice:Double = 0
    
    let date = Date()
    let calendar = Calendar.current
   
    
    @IBOutlet weak var txtFromLocation: UITextField!
    @IBOutlet weak var txtToLocation: UITextField!
    
    @IBOutlet weak var rydePool: UISwitch!
    var switchON : Bool = false
    
    @IBAction func checkState(_ sender: AnyObject) {
        
        if rydePool.isOn{
            rydePoolRate = 0.90
        }
        else if rydePool.isOn == false{
            rydePoolRate = 1.00
        }
        
    }
    
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

     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segueIdentifier" {
            
            if (txtFromLocation.text != "Sheridan Oakville" || txtToLocation.text != "Sheridan Brampton") {
                
                let alertController = UIAlertController(title: "Invalid Location", message:
                    "Please input a valid location.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }

    @IBAction func btnFindRide(_ sender: Any) {
        
        let hour = calendar.component(.hour, from: date)
        
        if (hour >= 16 && hour < 18){
            surgeHourRate = 1.20
        }
        
        else {
            surgeHourRate = 1.00
        }
        
        if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "Sheridan Brampton"){
            amtKm = SheridanToBrampton
        }
        
        else if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "The Boot Social") {
            amtKm = SheridanToBoot
        }
        
        else {
            print("invalid location")
        }
        
        totalPrice = (baseFare + (amtKm * (perKmCharge * surgeHourRate)) + serviceFees) * rydePoolRate
        
        if (totalPrice < minimumFee) {
            totalPrice = minimumFee
        }
    }
}

