//
//  ProgressBar.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct ProgressBar: View {
    let stage: Int
    var body: some View {
        HStack {
            ForEach(0..<5) { number in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 8)
                    .foregroundStyle(stage <= number ? .gray.opacity(0.5) : .teal)
            }
        }
        .padding()
    }
    init(for stage: Int) {
        self.stage = stage
    }
}
