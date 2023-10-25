//
//  ContentView.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 24.10.2023.
//

import SwiftUI

// Need height and weight to calculate BMI
// BMI = weight / (height * height)

struct ContentView: View {
    var body: some View {
        BMICalculator()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
