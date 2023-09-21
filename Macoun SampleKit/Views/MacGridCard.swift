//
//  MacCardBackground.swift
//  Macoun SampleKit
//
//  Created by Alexander Käßner on 21.09.23.
//

import SwiftUI

struct MacCardBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.background)
            .shadow(color: .black.opacity(0.1), radius: 1)
            .shadow(color: .black.opacity(0.1), radius: 2, y: 2)
            .shadow(color: .black.opacity(0.15), radius: 8, y: 4)
    }
}

#Preview {
    MacCardBackground()
        .padding()
        .background(.background)
}
