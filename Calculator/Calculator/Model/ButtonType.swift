//
//  ButtonType.swift
//  Calculator
//
//  Created by Consultant on 1/19/23.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digits (_ digits: Digit) //separate the underscore from the word so it can be valid when using it on the array
    case operation (_ operation: Operators) // same as before
    case equals
    case clear
    case allClear
    case decimal
    case percent
    case negative
    
    var description: String {
        switch self {
        case .digits(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "+/-"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return Color(.lightGray)
        case .operation, .equals:
            return Color(.orange)
        case .decimal, .digits:
            return Color(.darkGray)
        }
    }
    var foregroundColor: Color{
        switch self {
        case .digits, .operation, .equals, .decimal:
            return Color(.white)
        default:
            return Color(.black)
        }
    }
}
