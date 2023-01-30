//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Consultant on 1/20/23.
//
import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        let buttonType: ButtonType
        
        @EnvironmentObject private var viewModel: ViewModel //this will notify the viewmodel when a button is pressed
        
        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType) //this will notify the viewmodel when a button is pressed
            }
            .buttonStyle(CalculatorButtonStyle(
                size: getButtonSize(),
                backgroundColor: getBackgroundColor(),
                foregroundColor: getForegroundColor(),
                isWide: buttonType == .digits(.zero))
                         
            )
        }
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
            }

        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
            }
    }
}
