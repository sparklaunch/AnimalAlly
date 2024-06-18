//
//  CheckBox.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .foregroundStyle(isChecked ? .teal : .gray)
            .onTapGesture {
                self.isChecked.toggle()
            }
    }
}
