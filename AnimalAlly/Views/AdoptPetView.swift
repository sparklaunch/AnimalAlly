//
//  AdoptPetView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/18/24.
//

import SwiftUI

struct AdoptPetView: View {
    @State private var animalType = AnimalType.all
    var body: some View {
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
        }
        .navigationTitle("입양하기")
    }
}

#Preview {
    AdoptPetView()
}
