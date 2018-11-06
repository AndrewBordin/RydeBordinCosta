//
//  ViewController.swift
//  RydeBordinCosta
//
//  Created by Andrew Bordin and Fernando Costa on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    //Set up variables and constants given on the assignment
    let baseFare:Double = 2.50
    let perKmCharge:Double = 0.81
    let serviceFees:Double = 1.75
    let minimumFee:Double = 4.64
    
    let SheridanToBrampton:Double = 40.70
    let SheridanToBoot:Double = 4.8
    
    var amtKm:Double = 0
    var totalPrice:Double = 0
    var distanceCharged:Double = 0.00
    
    //Multipliers which will change value depending on the app usage hours
    //or if the user chooses rydePool
    var rydePoolRate:Double = 1.00
    var surgeHourRate:Double = 1.00
    
    
    //Get current hour for the surgeHourRate
    let date = Date()
    let calendar = Calendar.current
   
    
    //Declaration of UI Variables
    @IBOutlet weak var txtFromLocation: UITextField!
    @IBOutlet weak var txtToLocation: UITextField!
    
    @IBOutlet weak var rydePool: UISwitch!
    var switchON : Bool = false
    
    //Check if user wants rydePool or not
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
    
    //Sending the values from the main page to the confirmation page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let fromLocation = txtFromLocation.text!
        let toLocation = txtToLocation.text!
        
        let page2 = segue.destination as! ConfirmationViewController
        page2.fromLocation = fromLocation
        page2.toLocation = toLocation
        page2.totalPrice = totalPrice
        page2.serviceFee = serviceFees
        page2.distanceCharge = distanceCharged
        page2.bookingFeePrice = baseFare
        
    }

    //Function that checks if the segue should happen or not
    //If the user inputs invalid locations, then an alert is shown and the segue
    //does not perform
     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segueIdentifier" {
            
            if (txtFromLocation.text != "Sheridan Oakville" && (txtToLocation.text != "Sheridan Brampton" || txtToLocation.text != "The Boot Social")) {
                
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

    //Perform Calculations and Error checking when user clicks 'Find My Ryde'
    @IBAction func btnFindRide(_ sender: Any) {
        //Getting the current time, time will be in military time
        let hour = calendar.component(.hour, from: date)
        
        if (hour >= 16 && hour < 18){
            surgeHourRate = 1.20
        }
        
        else {
            surgeHourRate = 1.00
        }
        
        //Checking the locations the user has inputed and setting the total amount in km
        if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "Sheridan Brampton"){
            amtKm = SheridanToBrampton
        }
        else if (txtFromLocation.text == "Sheridan Oakville" && txtToLocation.text == "The Boot Social") {
            amtKm = SheridanToBoot
        }
        else {
            print("invalid location")
        }
        
        distanceCharged = amtKm * (perKmCharge * surgeHourRate)
        totalPrice = (baseFare + (distanceCharged) + serviceFees) * rydePoolRate
        
        //Checking if the total price is lower than $4.64 (Minimum fee)
        if (totalPrice < minimumFee) {
            totalPrice = minimumFee
        }
    }
}

