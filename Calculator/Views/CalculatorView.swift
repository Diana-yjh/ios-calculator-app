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
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {}
    
    @IBAction func decimalPointButton(_ sender: UIButton) {
        guard let decimalPoint = sender.titleLabel?.text else {
            return
        }
        
        updateOperandLabel(with: decimalPoint)
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        updateOperandLabel(with: number)
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        addCalculation(with: operatorLabel.text ?? "", and: operandLabel.text ?? "")
        
        delegate?.returnResult()
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        let operand = operandLabel.text ?? ""
        let `operator` = operatorLabel.text ?? ""
        
        addCalculation(with: sender.titleLabel?.text ?? "", and: operand)
        updateStackView(operator: `operator`, operand: operand)
        scrollDownToEnd()
    }
    
    @IBAction func plusMinusSignButton(_ sender: UIButton) {
        guard let number = operandLabel.text else {
            return
        }
        
        if number.first == "-" {
            operandLabel.text = String(number.dropFirst())
            return
        }
        
        operandLabel.text = "-" + number
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
    
    @IBAction func allClearButton(_ sender: UIButton) {
        //1. Clear queue, 2. Update UI
        delegate?.clearCalculatingProcess()
    }
}

extension CalculatorView {
    func updateOperandLabel(with number: String) {
        guard let text = operandLabel.text else {
            return
        }
        
        if text == "0" && number != "." {
            operandLabel.text = number
            return
        }
        
        if text.contains(".") && number == "." {
            return
        }
        
        operandLabel.text = text + number
    }
    
    func addCalculation(with operator: String, and operand: String) {
        
        let beforeOperator = operatorLabel.text ?? ""
        
        operatorLabel.text = `operator`
        
        if operand == "0" {
            return
        }
        
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
    
    func scrollDownToEnd() {
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + scrollView.contentInset.bottom)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
