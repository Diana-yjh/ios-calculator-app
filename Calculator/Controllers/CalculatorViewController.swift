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
    }
    
    func clearCalculatingProcess() {
        calculateString = ""
        
        initCalculatorView(with: "0")
    }
    
    func returnResult() {
        let log = calculateString.split(with: ",").joined()
        var formula = ExpressionParser.parse(from: log)
        calculateString = ""
        
        let result = formula.result()
        var resultToString = String(result)
        
        if result.isNaN {
            initCalculatorView(with: "NaN")
            return
        }
        
        while resultToString.contains(".") && resultToString.last == "0" {
            resultToString.removeLast()
        }
        
        if resultToString.last == "." {
            resultToString.removeLast()
        }
        
        initCalculatorView(with: resultToString.formatter() )
    }
}
