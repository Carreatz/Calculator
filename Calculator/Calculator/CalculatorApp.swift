//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Consultant on 1/19/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
