//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by thisisyusub on 17.12.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLevel: UILabel!
    @IBOutlet var tipButtons: [UIButton]!
    
    
    var tip: Double = 0.1
    var splitCount: Int = 2
    var bill: String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTIpChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        let index = sender.tag
        
        for i in 0..<3 {
            tipButtons[i].isSelected = index == i
        }
        
        let tipTitle = tipButtons[index].currentTitle!.dropLast()
        tip = Double(tipTitle)! / 100
        
        print(tip)
    }
    
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        splitCount = Int(sender.value)
        splitNumberLevel.text = "\(splitCount)"
    }
    
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        let billValue = billTextField.text
        
        if billValue == nil || billValue!.isEmpty {
            return
        }
        
        let parsed = Double(billValue!)!
        
        let result = parsed * (1 + tip) / Double(splitCount)
        bill = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultView = segue.destination as! ResultViewController
            resultView.bill = bill
            resultView.people = splitCount
            resultView.tip = tip * 100
        }
    }
}
