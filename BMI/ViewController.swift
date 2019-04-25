//
//  ViewController.swift
//  BMI
//
//  Created by Daniel Aditya Istyana on 24/04/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightSliderOutlet: UISlider!
    @IBOutlet weak var bmiCalculatorLabel: UILabel!
    @IBOutlet weak var smallBmiLabel: UILabel!
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.1f kg", sender.value)
        weightValueLabel.text = weight
        let bmiResult = calculateBMI(weight: weightSliderOutlet.value, height: heightValueOutlet.value)
        bmiResultValueLabel.text = String(format: "%.1f", bmiResult)
    }
    
    @IBOutlet weak var heightValueOutlet: UISlider!
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.1f m", sender.value)
        heightValueLabel.text = height
        let bmiResult = calculateBMI(weight: weightSliderOutlet.value, height: heightValueOutlet.value)
        bmiResultValueLabel.text = String(format: "%.1f", bmiResult)
    }
    
    @IBOutlet weak var bmiResultValueLabel: UILabel!
    @IBOutlet weak var bmiStatusLabel: UILabel!
    @IBAction func darkModeControl(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .white
            weightValueLabel.textColor = .black
            heightValueLabel.textColor = .black
            weightSliderOutlet.tintColor = .blue
            heightValueOutlet.tintColor = .blue
            bmiResultValueLabel.textColor = .black
            bmiStatusLabel.textColor = .black
            bmiCalculatorLabel.textColor = .black
            smallBmiLabel.textColor = .black
        case 1:
            view.backgroundColor = .black
            weightValueLabel.textColor = .white
            heightValueLabel.textColor = .white
            weightSliderOutlet.tintColor = .orange
            heightValueOutlet.tintColor = .orange
            bmiResultValueLabel.textColor = .white
            bmiStatusLabel.textColor = .white
            bmiCalculatorLabel.textColor = .white
            smallBmiLabel.textColor = .white
        default:
            break
        }
    }
    @IBOutlet weak var darkModeOutlet: UISegmentedControl!
    
    func calculateBMI(weight: Float, height: Float) -> Float {
        let result = weight / (height * height)
        
        switch result {
        case _ where result < 18.5:
            bmiStatusLabel.text = "Underweight"
            bmiStatusLabel.textColor = .orange
        case 18.5...22.9:
            bmiStatusLabel.text = "Normal"
            bmiStatusLabel.textColor = .green
        case 23...24.9:
            bmiStatusLabel.text = "Overweight"
            bmiStatusLabel.textColor = .orange
        case _ where result > 25:
            bmiStatusLabel.text = "Obese"
            bmiStatusLabel.textColor = .red
        default:
            break
        }
        
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

