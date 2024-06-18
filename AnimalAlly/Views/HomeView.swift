//
//  HomeView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(UserStorage.self) private var userStorage
    @Environment(AnimalStorage.self) private var animalStorage
    @State private var searchText = ""
    @State private var geometryReaderHeight = 0.0
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("안녕하세요, \(userStorage.currentUser?.name ?? "Anonymous")!")
                        Text("구조할 준비가 되셨나요?")
                            .font(.headline)
                    }
                    Spacer()
                    Button {
                        checkNotifications()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.teal.opacity(0.25))
                                .frame(width: 35, height: 35)
                            Image(systemName: "bell")
                        }
                    }
                    .foregroundStyle(.black)
                }
                .padding(.horizontal)
                TextField("가까운 NGO 찾기", text: $searchText)
                    .textFieldStyle(CustomTextFieldStyle(type: .search, isVisible: .constant(true)))
                    .padding(.horizontal)
                HStack {
                    GeometryReader { proxy in
                        Button {

                        } label: {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.teal.opacity(0.25))
                                VStack(alignment: .leading) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                                            .fill(.teal)
                                        Image(systemName: "pawprint")
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                                    .fixedSize()
                                    Text("입양하기")
                                    Text("입양 가능한 동물들을 알아보세요")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                }
                                .padding()
                            }
                            .frame(width: proxy.size.width, height: proxy.size.width)
                            .foregroundStyle(.black)
                            .onAppear {
                                geometryReaderHeight = proxy.size.width
                            }
                        }
                    }
                    .frame(height: geometryReaderHeight)
                    GeometryReader { proxy in
                        Button {

                        } label: {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.teal.opacity(0.25))
                                VStack(alignment: .leading) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                                            .fill(.teal)
                                        Image(systemName: "magnifyingglass")
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                                    .fixedSize()
                                    Text("분실 동물")
                                    Text("분실 동물을 신고하세요")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                }
                                .padding()
                            }
                            .frame(width: proxy.size.width, height: proxy.size.width)
                        }
                        .foregroundStyle(.black)
                    }
                    .frame(height: geometryReaderHeight)
                }
                .padding(.horizontal)
                Button {

                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.teal.opacity(0.25))
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.teal)
                                Image(systemName: "calendar")
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                            .fixedSize()
                            VStack(alignment: .leading) {
                                Text("피드")
                                Text("피드와 업데이트")
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                }
                .foregroundStyle(.black)
                .padding(.horizontal)
                HStack {
                    Text("근처")
                    Spacer()
                    Button("모두 보기") {

                    }
                    .foregroundStyle(.black)
                }
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(animalStorage.animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .stroke(.teal)
                                    VStack(alignment: .leading) {
                                        Image(animal.imageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(animal.name)
                                        Text(animal.species)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(8)
                                }
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .padding(.horizontal)
                }
                HStack {
                    Text("도울 수 있는 방법 알아보기")
                    Spacer()
                }
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack(alignment: .leading) {
                            Image(.volunteer)
                                .resizable()
                                .scaledToFit()
                            Text("자원 봉사")
                                .font(.caption)
                        }
                        VStack(alignment: .leading) {
                            Image(.buyDailyItems)
                                .resizable()
                                .scaledToFit()
                            Text("물품 구매")
                                .font(.caption)
                        }
                        VStack(alignment: .leading) {
                            Image(.donations)
                                .resizable()
                                .scaledToFit()
                            Text("기부")
                                .font(.caption)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("확인") {}
        } message: {
            Text(alertMessage)
        }
    }
    func checkNotifications() {
        showingAlert = true
        alertTitle = "알림 없음"
        alertMessage = "새로운 알림이 없습니다"
    }
}

#Preview {
    HomeView()
        .environment(UserStorage())
        .environment(AnimalStorage())
}
