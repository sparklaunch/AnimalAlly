//
//  AnimalDetailView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/17/24.
//

import SwiftUI
import MapKit

struct AnimalDetailView: View {
    @Environment(UserStorage.self) private var userStorage
    @Environment(\.openURL) private var openURL
    @State private var isFavorite = false
    let animal: Animal
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 5, style: .continuous))
                    .padding()
                    .overlay(alignment: .topTrailing) {
                        Button {
                            favoriteAnimal()
                        } label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.largeTitle)
                                .foregroundStyle(.red)
                                .padding(30)
                        }
                        .foregroundStyle(.black)
                    }
                Text(animal.name)
                    .font(.title)
                    .padding(.horizontal)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.25))
                        VStack(alignment: .leading) {
                            Text("성별")
                                .foregroundStyle(.gray)
                            Text(animal.gender.rawValue)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.25))
                        VStack(alignment: .leading) {
                            Text("연령")
                                .foregroundStyle(.gray)
                            Text(animal.age, format: .number)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.25))
                        VStack(alignment: .leading) {
                            Text("크기")
                                .foregroundStyle(.gray)
                            Text(animal.size.rawValue)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                }
                .padding([.horizontal, .bottom])
                if let description = animal.description {
                    VStack(alignment: .leading) {
                        Text("이 동물에 대하여")
                            .font(.title3)
                        Text(description)
                    }
                    .padding(.horizontal)
                }
                VStack(alignment: .leading) {
                    Text("현위치")
                    Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: animal.location.latitude, longitude: animal.location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))))
                        .frame(height: 300)
                        .clipShape(.rect(cornerRadius: 5, style: .continuous))
                }

                .padding()
            }
        }
        .onAppear {
            if userStorage.currentUser!.favoriteAnimals.contains(animal) {
                isFavorite = true
            } else {
                isFavorite = false
            }
        }
    }
    func favoriteAnimal() {
        if isFavorite {
            userStorage.currentUser?.favoriteAnimals.remove(animal)
            isFavorite = false
        } else {
            userStorage.currentUser?.favoriteAnimals.insert(animal)
            isFavorite = true
        }
    }
}
