//
//  UserDetailView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(UserStorage.self) private var userStorage
    @State private var geometryReaderHeight = 0.0
    private var currentUser: User {
        if let currentUser = userStorage.currentUser {
            currentUser
        } else {
            .example
        }
    }
    var body: some View {
        ScrollView {
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.5))
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.teal)
                                Image(systemName: "hands.and.sparkles")
                                    .padding()
                                    .foregroundStyle(.white)
                            }
                            .fixedSize()
                            VStack(alignment: .leading) {
                                Text("기부")
                                Text(300_000, format: .currency(code: "KRW"))
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.5))
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.teal)
                                Image(systemName: "pawprint")
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                            .fixedSize()
                            VStack(alignment: .leading) {
                                Text("입양")
                                Text("1 마리")
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.teal.opacity(0.25))
                    VStack(alignment: .leading, spacing: 10) {
                        Text("계정 보안")
                        NavigationLink {
                            ProfileDetailView()
                        } label: {
                            HStack {
                                Text("프로필 정보")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        NavigationLink {
                            PasswordResetView()
                        } label: {
                            HStack {
                                Text("비밀번호 재설정")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                    .padding()
                }
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.teal.opacity(0.25))
                    VStack(alignment: .leading, spacing: 10) {
                        Text("유저 선호")
                        NavigationLink {
                            PetPreferencesView()
                        } label: {
                            HStack {
                                Text("반려 동물 선호")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding()
            .navigationTitle("프로필")
        }
    }
}
