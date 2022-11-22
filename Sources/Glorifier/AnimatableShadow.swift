//
//  AnimatableShadow.swift
//  Created by no-comment
//

import SwiftUI

struct AnimatableShadow: ViewModifier, Animatable {
    var state: Double
    var shadowOffset: Double = 50
    var shadowRadius: Double = 5
    var shadowColor: Color = .black

    var animatableData: Double {
        get { state }
        set { state = newValue }
    }

    func body(content: Content) -> some View {
        content
            .shadow(color: shadowColor, radius: shadowRadius, x: sin(state) * shadowOffset, y: -cos(state) * shadowOffset)
    }
}

extension View {
    func animatableShadow(state: Double,
                          shadowOffset: Double = 10,
                          color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
                          radius: CGFloat,
                          x: CGFloat = 0,
                          y: CGFloat = 0) -> some View {
        self.modifier(AnimatableShadow(state: state, shadowOffset: shadowOffset, shadowRadius: radius, shadowColor: color))
    }
}
