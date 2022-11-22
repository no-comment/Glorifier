//
//  Glorifier.swift
//  Created by no-comment
//

import SwiftUI

public extension View {
    func glorified() -> some View {
        // wrap in ZStack to fix preview; otherwise shadow won't move
        ZStack {
            self.modifier(GlorifierEffect())
        }
    }
}

struct Glorifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 100) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: 70, height: 70)
                .glorified()

            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: 140, height: 140)
                .glorified()
        }
    }
}
