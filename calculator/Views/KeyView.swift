//
//  KeyView.swift
//  calculator
//
//  Created by Jindong Du on 11/30/23.
//

import SwiftUI

struct KeyView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative,.percent,.divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five,.six,.substract],
        [.one, .two, .three,.add],
        [.zero,.decimal,.equal]
    ]
    
    
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ?
                                     Color("num").opacity(0.4) :
                                        Color.pink.opacity(0.3))
                    .scaleEffect(changeColor ?
                                 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                    .foregroundColor(.black))
            }.padding()
            ForEach(buttons, id: \.self){
                row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){
                        element in
                        Button {
                            self.didTap(button: element)
                        } label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .frame(width: self.getWidth(elem: element), height: self.getHeight(elem: element))
                                .background(element.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(self.getWidth(elem: element)/2)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }

                    }
                }.padding(.bottom,4)
            }
        }
    }
    func getWidth(elem: Keys)->CGFloat{
        if elem == .zero{
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    func getHeight(elem: Keys)->CGFloat{
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    func didTap(button: Keys){
        switch button {
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .substract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal{
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal{
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

#Preview {
    KeyView()
}
