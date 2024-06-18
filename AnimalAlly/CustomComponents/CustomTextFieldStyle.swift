//
//  CustomTextFieldStyle.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/14/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    let type: CustomTextFieldType
    @Binding var isVisible: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            configuration
                .padding(8)
                .padding(.leading, 5)
                .padding(.trailing, 50)
                .background(alignment: .center) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(.secondary)
                    HStack {
                        Spacer()
                        switch type {
                            case .emailAddress:
                                Image(systemName: "at")
                                    .foregroundStyle(.teal)
                                    .padding(.trailing)
                            case .password(let isVisible):
                                if isVisible {
                                        Image(systemName: "eye")
                                            .foregroundStyle(.teal)
                                            .padding(.trailing)
                                            .offset(x: 3)
                                            .highPriorityGesture(
                                                TapGesture()
                                                    .onEnded {
                                                        self.isVisible = false
                                                    }
                                            )
                                } else {
                                        Image(systemName: "eye.slash")
                                            .foregroundStyle(.red)
                                            .padding(.trailing)
                                            .offset(x: 3)
                                            .highPriorityGesture(
                                                TapGesture()
                                                    .onEnded {
                                                        self.isVisible = true
                                                    }
                                            )
                                }
                            case .search:
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundColor(.teal)
                                    .padding(.trailing)
                            default:
                                Spacer()
                        }
                    }
                }
        }
    }
}
