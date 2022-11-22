//
//  GlorifierEffect.swift
//  Created by no-comment
//

import SwiftUI

struct GlorifierEffect: ViewModifier {
    private let duration: CGFloat = 14
    @State private var rad: Double = 0
    @State private var rotate: Bool = false

    @State private var size: Double = 0

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        self.size = geo.size.width
                    }
                    return Color.clear
                }
            }
            .overlay {
                GeometryReader { geo in
                    Circle()
                        .fill(
                            RadialGradient(colors: [.white.opacity(0.2), .clear],
                                           center: .center,
                                           startRadius: 1,
                                           endRadius: geo.size.width / 2)
                        )
                        .frame(width: geo.size.width, height: geo.size.width)
                        .offset(y: geo.size.width / 3)
                }
                .rotationEffect(.radians(rad + .pi))
            }
            .mask({ content })
            .rotation3DEffect(.degrees(rotate ? 10 : -10), axis: (x: 1.0, y: 0, z: 0))
            .animation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true), value: rotate)
            .rotation3DEffect(.degrees(rotate ? 10 : -10), axis: (x: 0, y: 1, z: 0))
            .animation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true).delay(duration / 4), value: rotate)
            .animatableShadow(state: rad, shadowOffset: size / 5, color: .gray, radius: size / 10)
            .onAppear {
                withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                    rad = 2 * (Double.pi)
                }
                rotate.toggle()
            }
    }
}
