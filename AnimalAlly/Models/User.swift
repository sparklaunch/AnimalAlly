//
//  User.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import SwiftUI

struct User: Identifiable, Codable, Hashable {
    static let example = User(name: "Jinwook Kim", emailAddress: "jinwookkim@gmail.com", password: "jinwookkim123!", address: "Seoul, Korea", radius: 23.0, favoriteAnimals: [.example], favor: .example)
    var id = UUID()
    let name: String
    let emailAddress: String
    var password: String
    let address: String
    var photoName: String?
    let radius: Double
    var favoriteAnimals: Set<Animal> = []
    let favor: Favor
    init(id: UUID = UUID(), name: String, emailAddress: String, password: String, address: String, photoName: String? = nil, radius: Double, favoriteAnimals: Set<Animal>, favor: Favor) {
        self.id = id
        self.name = name
        self.emailAddress = emailAddress
        self.password = password
        self.address = address
        self.photoName = photoName
        self.radius = radius
        self.favoriteAnimals = favoriteAnimals
        self.favor = favor
    }
}

extension User: Equatable {
    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
