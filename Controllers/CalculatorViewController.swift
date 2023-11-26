//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentuPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChaged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentuPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        //        if sender == zeroPctButton {
        //            zeroPctButton.isSelected = true
        //            tenPctButton.isSelected = false
        //            twentuPctButton.isSelected = false
        //           // billTextField.text = "0"
        //        } else if sender == tenPctButton {
        //            tenPctButton.isSelected = true
        //            zeroPctButton.isSelected = false
        //            twentuPctButton.isSelected = false
        //           // billTextField.text = "0.1"
        //        } else if sender == twentuPctButton {
        //            twentuPctButton.isSelected = true
        //            tenPctButton.isSelected = false
        //            zeroPctButton.isSelected = false
        //            //billTextField.text = "0.2"
        //        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        //        var bill = billTextField.text!
        //
        //        if zeroPctButton.isSelected {
        //            percents = 0
        //            print((Float(bill)! + (Float(bill)! * Float(percents)) / Float(numberOfGuests)))
        //
        //        } else if tenPctButton.isSelected {
        //            percents = 0.1
        //            print((Float(bill)! + (Float(bill)! * Float(percents)) / Float(numberOfGuests)))
        //
        //        } else if twentuPctButton.isSelected {
        //            percents = 0.2
        //            print((Float(bill)! + (Float(bill)! * Float(percents)) / Float(numberOfGuests)))
        //
        //        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}



