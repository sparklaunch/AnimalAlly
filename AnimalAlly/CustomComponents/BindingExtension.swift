//
//  BindingExtension.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

extension Binding {
    public func onChange(perform action: @escaping () -> Void) -> Self where Value: Equatable {
        .init(
            get: {
                self.wrappedValue
            },
            set: { newValue in
                guard self.wrappedValue != newValue else {
                    return
                }
                self.wrappedValue = newValue
                action()
            }
        )
    }
    public func onChange(perform action: @escaping (_ newValue: Value) -> Void) -> Self where Value: Equatable {
        .init(
            get: {
                self.wrappedValue
            },
            set: { newValue in
                guard self.wrappedValue != newValue else {
                    return
                }
                self.wrappedValue = newValue
                action(newValue)
            }
        )
    }
}
