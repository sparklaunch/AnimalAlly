//
//  AnimalAllyApp.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/14/24.
//

import SwiftUI

@main
struct AnimalAllyApp: App {
    @State private var router = Router()
    @State private var userStorage = UserStorage()
    @State private var animalStorage = AnimalStorage()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
                .environment(userStorage)
                .environment(animalStorage)
        }
    }
}
