//
//  CalculatorView.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/27.
//

import UIKit

protocol CalculatorViewDelegate {
    func addCalculate(string: String)
    func clearCalculatingProcess()
    func returnResult()
}

class CalculatorView: UIView {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var baseStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var delegate: CalculatorViewDelegate?
    
    @IBAction func operandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
        
        updateOperandLabel(with: operand)
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        var operand = operandLabel.text ?? ""
        let `operator` = operatorLabel.text ?? ""

        while operand.contains(".") && operand.last == "0" {
            operand.removeLast()
        }
        
        if operand.last == "." {
            operand.removeLast()
        }
        
        addCalculation(with: sender.titleLabel?.text ?? "", and: operand)
        updateStackView(operator: `operator`, operand: operand)
        scrollView.scrollToBottom()
    }
    
    @IBAction func allClearButton(_ sender: UIButton) {
        delegate?.clearCalculatingProcess()
    }
    
    @IBAction func clearEntryButton(_ sender: UIButton) {
        guard let labelText = operandLabel.text?.dropLast() else {
            return
        }
        
        if labelText.count == 0 {
            operandLabel.text = "0"
            return
        }
        
        operandLabel.text = String(labelText)
    }
    
    @IBAction func plusMinusSignButton(_ sender: UIButton) {
        guard let number = operandLabel.text, number != "NaN" else {
            return
        }
        
        if number.first == "-" {
            operandLabel.text = String(number.dropFirst())
            return
        }
        
        operandLabel.text = "-" + number
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        addCalculation(with: operatorLabel.text ?? "", and: operandLabel.text ?? "")
        
        delegate?.returnResult()
    }
}

extension CalculatorView {
    func updateOperandLabel(with newOperand: String) {
        guard var operand = operandLabel.text else {
            return
        }
        
        operand = operand.split(with: ",").joined()
        
        if operand.count > 20 {
            return
        }
        
        if operand == "0" && newOperand != "." {
            operandLabel.text = newOperand
            return
        }
        
        if operand.contains(".") && newOperand == "." {
            return
        }
        
        operandLabel.text = (operand + newOperand).formatter()
    }
    
    func addCalculation(with operator: String, and operand: String) {
        let beforeOperator = operatorLabel.text ?? ""
    
        operatorLabel.text = `operator`
    
        delegate?.addCalculate(string: beforeOperator + operand)
        
        operandLabel.text = "0"
    }
    
    func updateStackView(operator: String, operand: String) {
        let contentStackView = ContentStackView()
        contentStackView.axis = .horizontal
        
        contentStackView.setOperatorLabel(with: `operator`)
        contentStackView.setOperandLabel(with: operand)
        
        baseStackView.addArrangedSubview(contentStackView)
        scrollView.layoutIfNeeded()
    }
}
