//
//  UserStorage.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import SwiftUI

class UserStorage: Observable {
    static let targetURL = URL.documentsDirectory.appending(path: "users")
    var users = [User]() {
        didSet {
            save()
        }
    }
    var currentUser: User? {
        didSet {
            if let currentUser {
                if let userIndex = users.firstIndex(where: { user in
                    user.id == currentUser.id
                }) {
                    users[userIndex] = currentUser
                    save()
                }
            }
        }
    }
    init() {
        if let encodedUsers = try? Data(contentsOf: UserStorage.targetURL) {
            guard let decodedUsers = try? JSONDecoder().decode([User].self, from: encodedUsers) else {
                fatalError("Failed to decode users data")
            }
            users = decodedUsers
        } else {
            users = []
        }
    }
    func save() {
        guard let encodedUsers = try? JSONEncoder().encode(users) else {
            fatalError("Failed to encode users data")
        }
        do {
            try encodedUsers.write(to: UserStorage.targetURL, options: [.atomic, .completeFileProtection])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
