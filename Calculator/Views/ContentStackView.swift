//
//  ContentStackView.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/27.
//

import UIKit

class ContentStackView: UIStackView {
    let operandLabel = UILabel()
    let operatorLabel = UILabel()
    
    func setOperandLabel(with operand: String) {
        operandLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.minimumScaleFactor = 0.5
        operandLabel.font.withSize(15)
        
        self.addArrangedSubview(operandLabel)
        self.setCustomSpacing(10, after: operandLabel)
    }
    
    func setOperatorLabel(with `operator`: String) {
        operatorLabel.textColor = .white
        operatorLabel.text = `operator`
        operatorLabel.minimumScaleFactor = 0.5
        operatorLabel.font.withSize(15)
        
        self.addArrangedSubview(operatorLabel)
        self.setCustomSpacing(10, after: operatorLabel)
    }
}
