//
//  ContentView.swift
//  calculator
//
//  Created by Jindong Du on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.pink.opacity(0.3),.purple.opacity(0.5)]), startPoint: .top,endPoint: .bottom)
                .ignoresSafeArea(.all)
            KeyView()
        }
    }
}

#Preview {
    ContentView()
}
