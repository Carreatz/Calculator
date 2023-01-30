//
//  CalculatorView.swift
//  Calculator
//
//  Created by Consultant on 1/19/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var buttonTypes: [[ButtonType]] {
        [[.allClear, .negative, .percent, .operation(.divide)],
        [.digits(.seven), .digits(.eight), .digits(.nine), .operation(.times)],
        [.digits(.four), .digits(.five), .digits(.six), .operation(.minus)],
        [.digits(.one), .digits(.two), .digits(.three), .operation(.plus)],
        [.digits(.zero), .decimal, .equals]]
        
    }
    
    
    var body: some View {
        VStack { /*the vstack for the view separating the spacer, from
                  the display text (where the numbers and result would display) and the buttons */
            
            Spacer() //big space at the top
            displayText //calls whats in the variable displayText
            buttonPad //calls whats in the variable buttonPad
            //gives the little space at the bottom
        }
        .padding(Constants.padding)
        .background(Color.black)
        
        
    }
    private var buttonPad: some View {
        VStack (spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack (spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView()
        }
    }

    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
            .foregroundColor(Color.white)
    }
}




