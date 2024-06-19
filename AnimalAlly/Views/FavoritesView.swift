//
//  FavoritesView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(UserStorage.self) private var userStorage
    private var favoriteAnimals: [Animal] {
        guard let currentUser = userStorage.currentUser else {
            fatalError("Failed to find current user")
        }
        return currentUser.favoriteAnimals.sorted()
    }
    var body: some View {
        if favoriteAnimals.isEmpty {
            Text("즐겨찾기한 동물이 없습니다!")
        } else {
            List(favoriteAnimals) { animal in
                NavigationLink {
                    AnimalDetailView(animal: animal)
                } label: {
                    HStack {
                        Image(animal.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        VStack(alignment: .leading) {
                            Text(animal.name)
                            Text(animal.species)
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("즐겨찾기")
        }
    }
}

#Preview {
    FavoritesView()
        .environment(UserStorage())
}
