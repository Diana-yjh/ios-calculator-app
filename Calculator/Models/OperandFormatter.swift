//
//  OperandFormatter.swift
//  Calculator
//
//  Created by Yejin Hong on 3/3/24.
//

func operandFormatter(with operand: String) -> String {
    let integer = operand.split(with: ".").first ?? ""
    var decimal = ""
    
    if operand.contains(".") {
        decimal = "." + (operand.split(with: ".").last ?? "")
    }
    
    var interval = 1
    var integerReversed = ""
    var result = ""
    
    for character in integer.reversed() {
        integerReversed += String(character)
        
        if interval == 3 {
            integerReversed += ","
            interval = 0
        }

        interval += 1
    }
    
    result = integerReversed.reversed().map{ String($0) }.joined()
    
    if integer.count % 3 == 0 {
        result.removeFirst()
    }
    
    return result + decimal
}
