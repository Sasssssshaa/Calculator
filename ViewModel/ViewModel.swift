//
//  ViewModel.swift
//  MyCalculator
//
//  Created by Admin on 09.06.25.
//

import SwiftUI


class ViewModel: ObservableObject {
    //MARK: Property
    @Published var value = "0"
    @Published var number: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .devider],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plas],
        [.zero, .decimal, .equal]
    ]
        
    //MARK: Tap Button Method
    func didTap(item: Buttons) {
        switch item {
        case .plas, .minus, .devider, .multiple:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
            
        case .equal:
            if let currentValue = Double(value) {
                value = performResult(perfomeOperation(currentValue))
            }
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                value = performResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = performResult(-currentValue)
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    //MARK: Helper Calculate Method
    func perfomeOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
            case .additions:
                return number + currentValue
        case .substract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .devide:
            return number / currentValue
        case .none:
            return currentValue
        }
    }
    
    //MARK: Remuve last zero Method
    func performResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    //MARK: Size of buttons methods
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * totalSpacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - totalSpacing) / totalColums * 2
        }
        return (screenWidth - totalSpacing) / totalColums

    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColums
    }
}
