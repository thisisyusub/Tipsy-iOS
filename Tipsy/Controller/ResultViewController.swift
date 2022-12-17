//
//  ResultViewController.swift
//  Tipsy
//
//  Created by thisisyusub on 17.12.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill: String?
    var people: Int?
    var tip: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = bill
        settingsLabel.text = "people: \(people!), tip: \(tip!)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
