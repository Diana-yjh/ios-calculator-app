//
//  ScrollView+.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/03/01.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.height + self.contentInset.bottom)
        self.setContentOffset(bottomOffset, animated: true)
    }
}
