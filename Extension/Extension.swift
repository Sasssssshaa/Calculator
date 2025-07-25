//
//  Extension.swift
//  MyCalculator
//
//  Created by Admin on 08.06.25.
//

import SwiftUI

extension Color {
    static let darkGrayCalc1 = Color("darkGrayCalc")
    static let orangeCalc1 = Color("orangeCalc")
    static let grayCalc1 = Color("grayCalc")
}

extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case .plas:
            return .additions
        case .minus:
            return .substract
        case .devider:
            return .devide
        case .multiple:
            return .multiply
        default:
            return .none
        }
    }
}

