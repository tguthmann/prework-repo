//
//  ViewController.swift
//  TipIt
//
//  Created by Tina Guthmann on 2/24/17.
//  Copyright © 2017 Tina Guthmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    let tipPercentages = [0.10, 0.15, 0.20]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //load stored data
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let bill = defaults.double(forKey: "billKey")
        billField.text = String(format: "%.2f",bill)
        let tax = defaults.double(forKey: "defaultTaxKey")
        print("load calc")
        
        calc(bill: bill, tax: tax)
        
    }
    
    //store data as view is disappearing
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        let bill = Double(billField.text!) ?? 0
        defaults.set(bill, forKey: "billKey")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //calculate totals
    func calc(bill:Double, tax:Double)
    {
        
        //let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        //let tax = Double(taxField.text!) ?? 0
        let taxDiv:Double=(tax/Double(100))
        let taxTotal = bill*(taxDiv)
        let total = bill + tip + taxTotal
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        taxLabel.text = String(format: "$%.2f",taxTotal)
        taxField.text = String(format: "%.2f", tax)+"%"
        
    }
    
    //calculate wrapper function
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        let tax = defaults.double(forKey: "defaultTaxKey")

        calc(bill: bill, tax: tax)
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

}

