//
//  ViewController.swift
//  Tipsy
//
//  Created by Marko Jovanov on 24.8.21.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip: Float = 0.1
    var splitPeople: Int = 2
    var billAmount: Float = 0.0
    var totalBillAmount: Float = 0.0
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        splitPeople = Int(sender.value)
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if sender == zeroPctButton {
            tip = 0.0
        }
        if sender == tenPctButton {
            tip = 0.1
        }
        if sender == twentyPctButton {
            tip = 0.2
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billString = billTextField.text ?? "0.0"
        billAmount = Float(billString) ?? 0.0
        totalBillAmount = billAmount * (1 + tip) / Float(splitPeople)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = String(format: "%.2f", totalBillAmount)
            destinationVC.totalSplit = splitPeople
            destinationVC.tip = tip
        }
    }

}

