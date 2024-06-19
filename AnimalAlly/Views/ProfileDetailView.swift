//
//  ProfileDetailView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct ProfileDetailView: View {
    @Environment(UserStorage.self) private var userStorage
    private var currentUser: User {
        if let currentUser = userStorage.currentUser {
            currentUser
        } else {
            .example
        }
    }
    var body: some View {
        VStack {
            HStack {
                Image(currentUser.photoName ?? "JinwookKim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                VStack(alignment: .leading) {
                    Text(currentUser.name)
                    Text(currentUser.emailAddress)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(.teal.opacity(0.25))
                VStack(alignment: .leading, spacing: 10) {
                    Text("주소")
                    Text(currentUser.address)
                }
                .padding()
            }
            .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding()
        .navigationTitle("프로필 정보")
    }
}
