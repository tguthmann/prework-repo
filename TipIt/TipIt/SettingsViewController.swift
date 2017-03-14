//
//  SettingsViewController.swift
//  TipIt
//
//  Created by Tina Guthmann on 3/12/17.
//  Copyright © 2017 Tina Guthmann. All rights reserved.
//

import UIKit

class SettingsViewController:
UIViewController {
    
    @IBOutlet weak var defaultTax: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    //load stored data
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tax = defaults.double(forKey: "defaultTaxKey")
        defaultTax.text = String(format: "%.2f",tax)
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //store data as screen is disappearing
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        let tax = Double(defaultTax.text!) ?? 0

        defaults.set(tax, forKey: "defaultTaxKey")
        defaults.synchronize()

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
