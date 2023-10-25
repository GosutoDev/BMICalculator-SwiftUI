//
//  Ticker.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI

struct Ticker: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length = rect.width / 2.2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: center)
        path.addLine(to: CGPoint(x: rect.midX + length , y: rect.midY))
        path.addLine(to: CGPoint(x: 180 , y: 110))
        path.move(to: CGPoint(x: rect.midX + length , y: rect.midY))
        path.addLine(to: CGPoint(x: 180 , y: 90))
        
        return path
    }
}

#Preview {
    Ticker()
}
