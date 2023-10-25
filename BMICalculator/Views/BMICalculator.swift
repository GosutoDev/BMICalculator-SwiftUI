//
//  MainView.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI

struct BMICalculator: View {
    
    @State private var weight: Double = 60
    @State private var heightInCentiMeter: Double = 174
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // TITLE
                Text("BMI Calculator")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.customBlue)
                
                Spacer()
                
                // Gender choose
                VStack(spacing: 15) {
                    Text("Gender:")
                        .font(.title2)
                        .foregroundStyle(.gray)
                    CustomButtonSlider()
                }
                
                Spacer()
                
                // Height Slider
                VStack(spacing: 15) {
                    Text("Height:")
                        .font(.title2)
                        .foregroundStyle(.gray)
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("\(Int(heightInCentiMeter))")
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.customBlue)
                        Text("cm")
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    CustomSlider(value: $heightInCentiMeter, min: 100, max: 250)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Weight Slider
                VStack(spacing: 15) {
                    Text("Weight:")
                        .font(.title2)
                        .foregroundStyle(.gray)
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("\(Int(weight))")
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.customBlue)
                        Text("kg")
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    CustomSlider(value: $weight, min: 0, max: 200)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Calculate Button
                NavigationLink {
                    ResultView(heightInCentiMeter: $heightInCentiMeter, weight: $weight)
                } label: {
                    Text("Calculate!")
                        .font(.title2).bold()
                        .foregroundStyle(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.cyanBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    BMICalculator()
}
