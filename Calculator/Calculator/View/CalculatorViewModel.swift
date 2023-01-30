//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Consultant on 1/23/23.
//

import Foundation
import Combine

extension CalculatorView {
    final class ViewModel: ObservableObject {
        
//        properties
        
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            let _: ButtonType = calculator.showAllClear ? .allClear : .clear
            return [
            [.allClear, .negative, .percent, .operation(.divide)],
            [.digits(.seven), .digits(.eight), .digits(.nine), .operation(.times)],
            [.digits(.four), .digits(.five), .digits(.six), .operation(.minus)],
            [.digits(.one), .digits(.two), .digits(.three), .operation(.plus)],
            [.digits(.zero), .decimal, .equals]]
        }
//        actions
        
        func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digits(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            }
        }
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
                    guard case .operation(let operation) = buttonType else { return false}
                    return calculator.operationIsHighlighted(operation)
                }
    }
}
