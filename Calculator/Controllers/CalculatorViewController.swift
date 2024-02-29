//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController, CalculatorViewDelegate {
    var calculateString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCalculatorView(with: "0")
    }
    
    func initCalculatorView(with operand: String) {
        guard let calculatorView = self.view as? CalculatorView else {
            return
        }
        
        calculatorView.operandLabel.text = operand
        calculatorView.operatorLabel.text = ""
        calculatorView.baseStackView.subviews.forEach{$0.removeFromSuperview()}
        
        calculatorView.delegate = self
    }
    
    func addCalculate(string: String) {
        calculateString += string
        print("calculateString = \(calculateString)")
    }
    
    func clearCalculatingProcess() {
        calculateString = ""
        initCalculatorView(with: "0")
    }
    
    func returnResult() {
        var formula = ExpressionParser.parse(from: calculateString)
        calculateString = ""
        print("result = \(formula.result())")
        initCalculatorView(with: String(formula.result()))
    }
}
