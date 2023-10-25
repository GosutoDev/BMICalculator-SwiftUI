//
//  Barometer.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI

struct Barometer: View {
    
    let bmi: Double
    
    var trimTo: CGFloat {
        if bmi > 39.9 {
            return 0.88
        }
        let index = bmi - 18.5
        let percentage = index / 0.28
        
        return 0.13 + (percentage / 100)
    }
    
    var arrowAngle: Double {
        if bmi <= 18.5 {
            return 44
        } else if bmi >= 40 {
            return 315
        }
        
        let defaultAngle = 44.0
        let index = bmi - 18.5
        let additionalAngle = index / 0.08
        
        return defaultAngle + additionalAngle
    }
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.12, to: 0.88)
                .stroke(.gray, style: StrokeStyle(lineWidth: 20,  dash: [2, 6]))
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.12, to: trimTo)
                .stroke(Color.cyanBlue, style: StrokeStyle(lineWidth: 20,  dash: [2, 6]))
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.11, to: 0.89)
                .stroke(Color.cyanBlue, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(90))
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.customBlue)
            Ticker()
                .stroke(Color.customBlue, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(arrowAngle + 90))
            Text(String(format: "%.2f", bmi))
                .font(.title).bold()
                .foregroundStyle(Color.customBlue)
                .underline()
                .frame(maxHeight: 175, alignment: .bottom)
        }
    }
}

#Preview {
    Barometer(bmi: 20)
}
