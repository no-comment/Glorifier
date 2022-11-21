//
//  Glorifier.swift
//  Created by no-comment
//

import SwiftUI

extension View {
    public func glorified() -> some View {
        self
            .glossEffect()
            .animatableShadow(state: 14, radius: 2)
    }
}

struct Glorifier_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.black)
            .frame(width: 140, height: 140)
            .glorified()
    }
}
