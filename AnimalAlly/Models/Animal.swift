//
//  Animal.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import Foundation
import MapKit

struct Animal: Identifiable, Codable, Hashable {
    static let example = Animal(name: "조도", age: 2, gender: .male, size: .medium, imageName: "Jodo", species: "골든 리트리버", animalType: .dog, isNearby: true, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    var id = UUID()
    let name: String
    let age: Int
    let gender: Gender
    let size: AnimalSize
    let imageName: String
    let species: String
    let animalType: AnimalType
    var location = Location(latitude: 37.413294, longitude: 127.0016985)
    var isNearby = false
    var description: String?
}

extension Animal: Comparable {
    static func <(lhs: Animal, rhs: Animal) -> Bool {
        lhs.name < rhs.name
    }
}
