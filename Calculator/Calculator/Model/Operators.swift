//
//  Operators.swift
//  Calculator
//
//  Created by Consultant on 1/19/23.
//

import Foundation

enum Operators: CaseIterable, CustomStringConvertible {
    case plus, minus, times, divide
    
    var description: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .times:
            return "x"
        case .divide:
            return "/"
        }
    }
}
