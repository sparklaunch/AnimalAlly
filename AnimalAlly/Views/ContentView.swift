//
//  ContentView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingMainView = false
    @Environment(Router.self) private var router
    var body: some View {
        @Bindable var bindableRouter = router
        ZStack {
            if showingMainView {
                NavigationStack(path: $bindableRouter.path) {
                    LogInView()
                        .transition(.opacity)
                        .navigationDestination(for: Screen.self) { screen in
                            switch screen {
                                case .signIn:
                                    LogInView()
                                case .signUp1:
                                    SignUp1View()
                                case .signUp2:
                                    SignUp2View()
                                case .signUp3:
                                    SignUp3View()
                                case .signUp4:
                                    SignUp4View()
                                case .signUp5:
                                    SignUp5View()
                                case .signUpComplete:
                                    SignUpCompleteView()
                                case .main:
                                    MainView()
                            }
                        }
                }
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showingMainView = true
                        }
                    }
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
