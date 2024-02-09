//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Aniket Pithadia on 28/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightUnit: UILabel!
    @IBOutlet weak var weightUnit: UILabel!
    @IBOutlet weak var unitSwitcher: UISegmentedControl!
    @IBOutlet weak var weightTextLabel: UITextField!
    @IBOutlet weak var heightTextLabel: UITextField!
    @IBOutlet weak var CalculateBMI: UIButton!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    
    @IBAction func onSwitchingUnits(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            weightUnit.text = "kg"
            heightUnit.text = "cm"
        }
            else {
                weightUnit.text = "lbs"
                heightUnit.text = "in"
        }
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        // Using guard statements to validate inputs and show errors accordingly
        
        guard let weightString = weightTextLabel.text, let weight = Double(weightString), weight > 0 else {
            if weightTextLabel.text?.isEmpty ?? true{
                resultTextLabel.text = "Weight Can't be Empty"
            }else{
                resultTextLabel.text = "Weight Can't be Negative"
            }
            classificationLabel.text = "Validation Error"
            return
        }
        guard let heightString = heightTextLabel.text,  let height = Double(heightString), height > 0 else {
                if heightTextLabel.text?.isEmpty ?? true {
                    resultTextLabel.text = "Height Can't be Empty"
                } else {
                    resultTextLabel.text = "Height Can't be Negative"
                }
                classificationLabel.text = "Validation Error"
                return
            }
        
        // Using conversion factor to be precise and easier to understand
        var heightConversionFactor: Double = 1.0
        var weightConversionFactor: Double = 1.0
        
        if unitSwitcher.selectedSegmentIndex == 1 {
            
            heightConversionFactor = 0.0254
            weightConversionFactor = 0.453592
        }else{
            heightConversionFactor = 0.01
        }
        let heightInMeters = height * heightConversionFactor
        let weightInKilograms = weight * weightConversionFactor
        
        // Calculating BMI
        let result = weightInKilograms / (heightInMeters * heightInMeters)
        resultTextLabel.text = String((result * 10).rounded() / 10)
        
        // Determining BMI classification
        switch result {
        case ..<18.5:
            classificationLabel.text = "Underweight"
        case 18.5..<25:
            classificationLabel.text = "Normal"
        case 25..<35:
            classificationLabel.text = "Overweight"
        default:
            classificationLabel.text = "Obese"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    

}

