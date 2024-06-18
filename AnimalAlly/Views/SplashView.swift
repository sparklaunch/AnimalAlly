//
//  SplashView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/14/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .scaleEffect(0.3)
    }
}

#Preview {
    SplashView()
}
