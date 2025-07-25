//
//  Model.swift
//  MyCalculator
//
//  Created by Admin on 08.06.25.
//

import SwiftUI

enum Operation {
    case additions, substract, multiply, devide, none
    
}
 
enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plas = "+"
    case minus = "-"
    case multiple = "x"
    case devider = "/"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    
    
    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.grayCalc1
        case .devider, .multiple, .minus, .plas, .equal:
            return Color.orangeCalc1
        default:
            return Color.darkGrayCalc1
        }
    }
    
    var buttonFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }

}
