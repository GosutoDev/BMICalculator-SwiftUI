//
//  CustomSlider.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI
import UIKit

struct CustomSlider: View {
    
    @Binding var value: Double
    
    var min: Double
    var max: Double
    
    init(value: Binding<Double>, min: Double, max: Double) {
        UISlider.appearance().maximumTrackTintColor = UIColor.clear
        UISlider.appearance().thumbTintColor = UIColor(#colorLiteral(red: 0.1724791229, green: 0.1866790652, blue: 0.6732267737, alpha: 1))
        
        self._value = value
        self.min = min
        self.max = max
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 2) {
                ForEach(0..<91) { index in
                    Circle()
                        .foregroundStyle(.black.opacity(0.5))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            Slider(value: $value, in: min...max, step: 1.0)
                .padding(.horizontal)
                .tint(.clear)
        }
    }
}

#Preview {
    CustomSlider(value: .constant(100.0), min: 20, max: 200)
}
