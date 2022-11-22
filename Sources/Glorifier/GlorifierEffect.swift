//
//  GlorifierEffect.swift
//  Created by no-comment
//

import SwiftUI

struct GlorifierEffect: ViewModifier {
    var duration: Double = 14
    var rotationIntensity: Double = 10
    var shadowColor: Color = .gray
    var shadowOffset: Double = 1 / 5

    @State private var rad: Double = 0
    @State private var rotate: Bool = false

    @State private var size: Double = 0

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        self.size = max(geo.size.width, geo.size.height)
                    }
                    return Color.clear
                }
            }
            .overlay {
                Circle()
                    .fill(
                        RadialGradient(colors: [.white.opacity(0.2), .clear],
                                       center: .center,
                                       startRadius: 1,
                                       endRadius: self.size / 2)
                    )
                    .frame(width: self.size, height: self.size)
                    .offset(y: self.size / 3)
                    .rotationEffect(.radians(rad + .pi))
            }
            .mask({ content })
            .animatableShadow(state: rad, shadowOffset: size * shadowOffset, color: shadowColor, radius: size * shadowOffset / 2)
            .rotation3DEffect(.degrees(rotate ? rotationIntensity : -rotationIntensity), axis: (x: 1.0, y: 0, z: 0))
            .animation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true), value: rotate)
            .rotation3DEffect(.degrees(rotate ? rotationIntensity : -rotationIntensity), axis: (x: 0, y: 1, z: 0))
            .animation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true).delay(duration / 4), value: rotate)
            .onAppear {
                withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                    rad = 2 * (Double.pi)
                }
                rotate.toggle()
            }
    }
}
