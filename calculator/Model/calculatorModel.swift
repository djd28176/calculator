//
//  calculatorModel.swift
//  calculator
//
//  Created by Jindong Du on 11/30/23.
//

import Foundation
import SwiftUI

enum Keys: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substract = "-"
    case divide = "÷"
    case multiply = "*"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color{
        switch self{
        case .add, .substract, .divide, .multiply,.equal:
            return Color("Voperator")
        case .clear, .percent, .negative:
            return Color("Hoperator")
        default:
            return Color("num")
        }
    }
}

enum Operation{
    case add, subtract, multiply, divide, none
}
