//
//  CircularView.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI

struct ResultView: View {
    
    let descriptionNames: [String] = ["Underweight", "Healthy", "Overweight", "Obese", "Highly Obese", "Extremely Obese"]
    let ranges: [String] = ["18.5 <", "18.5 - 24.9", "25 - 29.9", "30 - 34.9", "35 - 39.9", "40 >"]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var heightInCentiMeter: Double
    @Binding var weight: Double
    
    var bmi: Double {
        let heightInMeter = heightInCentiMeter / 100
        
        return weight / ( heightInMeter * heightInMeter)
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // TITLE
            Text("Your BMI Result")
                .font(.title).bold()
                .foregroundStyle(Color.customBlue)
            
            Spacer()
            
            // Barometer
            Barometer(bmi: bmi)
            
            Spacer()
            
            // Descriptions
            HStack(spacing: 40) {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(ranges, id: \.self) { range in
                        Text(range)
                            .font(.title3)
                            .foregroundStyle(changeColor(if: range, with: ranges) ? Color.customBlue : .gray)
                    }
                }
                VStack(alignment: .trailing, spacing: 15) {
                    ForEach(descriptionNames, id: \.self) { name in
                        Text(name)
                            .font(.title3)
                            .foregroundStyle(changeColor(if: name, with: descriptionNames) ? Color.customBlue : .gray)
                    }
                }
            }
            
            Spacer()
            
            //Recalculate button
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Recalculate!")
                    .font(.title2).bold()
                    .foregroundStyle(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.cyanBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            
            Spacer()
            
        }
        //Custom back button
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color.customBlue)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // Highlight current BMI description
    func changeColor(if name: String, with comparable: [String]) -> Bool {
        var changer: Bool = false
        
        if bmi <= 18.5 && name == comparable[0] {
            changer = true
        } else if bmi > 18.5 && bmi <= 24.9 && name == comparable[1]  {
            changer = true
        } else if bmi >= 25 && bmi <= 29.9 && name == comparable[2] {
            changer = true
        } else if bmi >= 30 && bmi <= 34.9 && name == comparable[3] {
            changer = true
        } else if bmi >= 35 && bmi <= 39.9 && name == comparable[4] {
            changer = true
        } else if bmi >= 40 && name == comparable[5] {
            changer = true
        }
        return changer
    }
    
}

#Preview {
    ResultView(heightInCentiMeter: .constant(174.0), weight: .constant(60.0))
}
