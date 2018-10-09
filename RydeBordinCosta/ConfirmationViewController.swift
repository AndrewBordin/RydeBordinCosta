//
//  ConfirmationViewController.swift
//  RydeBordinCosta
//
//  Created by Luiz Fernando Costa on 10/9/18.
//  Copyright © 2018 Andrew Bordin. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var txtConfirm: UILabel!
    @IBOutlet weak var txtFromLocation: UILabel!
    @IBOutlet weak var txtToLocation: UILabel!
    @IBOutlet weak var txtTotalPrice: UILabel!
    @IBOutlet weak var txtServiceFee: UILabel!
    @IBOutlet weak var txtDistanceCharge: UILabel!
    @IBOutlet weak var txtBookingFeePrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
