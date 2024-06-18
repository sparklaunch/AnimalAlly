//
//  AnimalStorage.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/17/24.
//

import Foundation

@Observable
class AnimalStorage {
    private let targetURL = URL.documentsDirectory.appending(path: "animals")
    var animals = [Animal]() {
        didSet {
            save()
        }
    }
    init() {
        if let encodedAnimals = try? Data(contentsOf: targetURL) {
            guard let decodedAnimals = try? JSONDecoder().decode([Animal].self, from: encodedAnimals) else {
                fatalError("Failed to decode animals data")
            }
            animals = decodedAnimals
        } else {
            animals = [Animal(name: "조도", age: 2, gender: .male, size: .medium, imageName: "Jodo", species: "골든 리트리버", isNearby: true, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."), Animal(name: "루나", age: 5, gender: .female, size: .small, imageName: "Luna", species: "데본 렉스", isNearby: true), Animal(name: "위스커스", age: 8, gender: .female, size: .small, imageName: "Whiskers", species: "아비시니안", isNearby: true)]
            save()
        }
    }
    func save() {
        guard let encodedAnimals = try? JSONEncoder().encode(animals) else {
            fatalError("Failed to encode animals data")
        }
        do {
            try encodedAnimals.write(to: targetURL, options: [.atomic, .completeFileProtection])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
