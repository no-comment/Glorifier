//
//  Glorifier.swift
//  Created by no-comment
//

import SwiftUI

public extension View {
    /// Adds Glorified Effect on View
    /// - Parameters:
    ///   - duration: number of seconds for one cycle
    ///   - rotationIntensity: intensity of 3D rotation effect
    ///   - shadowColor: color of the shadow
    ///   - shadowOffset: offset of the shadow
    func glorified(duration: Double = 15, rotationIntensity: Double = 10, shadowColor: Color = .gray, shadowOffset: Double = 15) -> some View {
        // wrap in ZStack to fix preview; otherwise shadow won't move
        ZStack {
            self.modifier(GlorifierEffect(duration: duration,
                                          rotationIntensity: rotationIntensity,
                                          shadowColor: shadowColor,
                                          shadowOffset: shadowOffset))
        }
    }
}

struct Glorifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 100) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: 70, height: 70)
                .glorified(duration: 2, rotationIntensity: 10, shadowColor: .green, shadowOffset: 20)

            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: 140, height: 140)
                .glorified(rotationIntensity: 30)

            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: 140, height: 140)
                .glorified()

            HStack(spacing: 0) {
                ForEach(1 ..< 10) { _ in
                    Rectangle().fill(.clear)
                    Rectangle().fill(.white.opacity(0.2))
                }
            }
            .background(Color.red)
            .mask({ Capsule() })
            .frame(width: 140, height: 40)
            .glorified()
        }
    }
}
