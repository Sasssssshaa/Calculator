//
//  MyCalculatorApp.swift
//  MyCalculator
//
//  Created by Admin on 08.06.25.
//

import SwiftUI

@main
struct MyCalculatorApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
