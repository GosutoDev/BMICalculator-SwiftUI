//
//  CustomButtonSlider.swift
//  BMICalculator
//
//  Created by Tomáš Duchoslav on 25.10.2023.
//

import SwiftUI

struct CustomButtonSlider: View {
    
    @State private var side: Alignment = .trailing
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 2)
                .foregroundStyle(.gray)
                .frame(width: 250, height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.customBlue)
                        .frame(width: 250 / 2, height: 50)
                        .frame(width: 250, alignment: side)
                        .overlay {
                            HStack(spacing: 0) {
                                Button("♀") {
                                    withAnimation {
                                        side = .leading
                                    }
                                }
                                .font(.title)
                                .bold()
                                .foregroundStyle(side == .trailing ? Color.customBlue : .white)
                                .frame(width: 250 / 2, height: 50)
                                
                                Button("♂") {
                                    withAnimation {
                                        side = .trailing
                                    }
                                }
                                .font(.title)
                                .bold()
                                .foregroundStyle(side == .leading ? Color.customBlue : .white)
                                .frame(width: 250 / 2, height: 50)
                            }
                        }
                }
        }
    }
}

#Preview {
    CustomButtonSlider()
}
