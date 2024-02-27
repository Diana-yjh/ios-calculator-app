//
//  CalculatorView.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/27.
//

import UIKit

protocol CalculatorViewDelegate {
    
}

class CalculatorView: UIView {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var minusPlusLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func zeroButton(_ sender: UIButton) {}
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {}
    
    @IBAction func decimalPointButton(_ sender: UIButton) {}
    
    @IBAction func oneButton(_ sender: UIButton) {
        
    }
    
    @IBAction func twoButton(_ sender: UIButton) {}
    
    @IBAction func threeButton(_ sender: UIButton) {}
    
    @IBAction func fourButton(_ sender: UIButton) {}
    
    @IBAction func fiveButton(_ sender: UIButton) {}
    
    @IBAction func sixButton(_ sender: UIButton) {}
    
    @IBAction func sevenButton(_ sender: UIButton) {}
    
    @IBAction func eightButton(_ sender: UIButton) {}
    
    @IBAction func nineButton(_ sender: UIButton) {}
    
    @IBAction func equalButton(_ sender: UIButton) {}
    
    @IBAction func plusButton(_ sender: UIButton) {}
    
    @IBAction func minusButton(_ sender: UIButton) {}
    
    @IBAction func multiplyButton(_ sender: UIButton) {}
    
    @IBAction func divideButton(_ sender: UIButton) {}
    
    @IBAction func plusMinusSignButton(_ sender: UIButton) {}
    
    @IBAction func clearEntryButton(_ sender: UIButton) {}
    
    @IBAction func allClearButton(_ sender: UIButton) {}
}
