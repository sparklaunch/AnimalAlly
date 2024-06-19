//
//  AdoptPetView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/18/24.
//

import SwiftUI

struct AdoptPetView: View {
    @Environment(AnimalStorage.self) private var animalStorage
    @State private var animalType = AnimalType.all
    @State private var geometryReaderHeight = 0.0
    private var filteredAnimals: [Animal] {
        animalStorage.animals.filter { animal in
            if animalType == .all {
                true
            } else {
                animal.animalType == animalType
            }
        }
    }
    var body: some View {
        ScrollView {
            VStack {
                Picker("종류 선택", selection: $animalType) {
                    ForEach(AnimalType.allCases, id: \.rawValue) { animalType in
                        Text(animalType.rawValue)
                            .tag(animalType)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                Spacer()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(filteredAnimals) { animal in
                        NavigationLink {
                            AnimalDetailView(animal: animal)
                        } label: {
                            VStack(alignment: .leading, spacing: .zero) {
                                GeometryReader { proxy in
                                    Image(animal.imageName)
                                        .resizable()
                                        .frame(width: proxy.size.width, height: proxy.size.height)
                                        .onAppear {
                                            geometryReaderHeight = proxy.size.width
                                        }
                                }
                                .frame(height: geometryReaderHeight)
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(.teal.opacity(0.25))
                                    Text(animal.name)
                                        .padding()
                                }
                                .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .foregroundStyle(.black)
                    }
                }
                .padding()
            }
            .navigationTitle("입양하기")
        }
    }
}
