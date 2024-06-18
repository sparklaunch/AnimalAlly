//
//  Animal.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import Foundation

struct Animal: Identifiable, Codable, Hashable {
    static let example = Animal(name: "조도", age: 2, gender: .male, size: .medium, imageName: "Jodo", species: "골든 리트리버", isNearby: true, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    var id = UUID()
    let name: String
    let age: Int
    let gender: Gender
    let size: AnimalSize
    let imageName: String
    let species: String
    var isNearby = false
    var description: String?
}
