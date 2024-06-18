//
//  ShowAllSheetView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/18/24.
//

import SwiftUI

struct ShowAllSheetView: View {
    let animals: [Animal]
    var body: some View {
        List(animals) { animal in
            HStack {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                VStack(alignment: .leading) {
                    Text(animal.name)
                    Text(animal.species)
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
                Spacer()
            }
        }
    }
}
