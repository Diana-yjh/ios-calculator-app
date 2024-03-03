//
//  String+.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func formatter() -> String {
        let integer = self.split(with: ".").first ?? ""
        var decimal = ""
        
        if self.contains(".") {
            decimal = "." + (self.split(with: ".").last ?? "")
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
}
