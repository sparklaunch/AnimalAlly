//
//  LogInView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/14/24.
//

import SwiftUI

struct LogInView: View {
    @Environment(Router.self) private var router
    @Environment(UserStorage.self) private var userStorage
    @State private var emailAddress = "jinwookkim@gmail.com"
    @State private var password = "jinwookkim123!"
    @State private var isPasswordVisible = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    var body: some View {
        ZStack {
            VStack {
                Image(.welcome)
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("이메일")
                    TextField("이메일", text: $emailAddress)
                        .textFieldStyle(CustomTextFieldStyle(type: .emailAddress, isVisible: .constant(true)))
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    if isPasswordVisible {
                        TextField("비밀번호", text: $password)
                            .textFieldStyle(CustomTextFieldStyle(type: .password(isVisible: isPasswordVisible), isVisible: $isPasswordVisible))
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("비밀번호", text: $password)
                            .textFieldStyle(CustomTextFieldStyle(type: .password(isVisible: isPasswordVisible), isVisible: $isPasswordVisible))
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                    }
                }
            }
            .padding()
            VStack {
                Spacer()
                Button {
                    signIn()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.teal)
                            .frame(height: 50)
                            .padding()
                        Text("로그인")
                            .foregroundStyle(.white)
                    }
                }
                HStack {
                    Text("아직 계정이 없으세요?")
                    Button("계정 만들기") {
                        router.path.append(Screen.signUp1)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
        .alert("오류", isPresented: $showingAlert) {
            Button("확인") {}
        } message: {
            Text(alertMessage)
        }
        .navigationBarBackButtonHidden()
    }
    func signIn() {
        if emailAddress.isEmpty {
            showingAlert = true
            alertMessage = "이메일을 입력해주세요"
            return
        }
        if !emailAddress.isValidEmailAddress {
            showingAlert = true
            alertMessage = "올바른 이메일 형식이 아닙니다"
            return
        }
        if password.isEmpty {
            showingAlert = true
            alertMessage = "비밀번호를 입력해주세요"
            return
        }
        let emailIndex = userStorage.users.firstIndex { user in
            user.emailAddress == emailAddress
        }
        if let emailIndex {
            let targetUser = userStorage.users[emailIndex]
            print(targetUser.favoriteAnimals)
            if targetUser.password == password {
                userStorage.currentUser = targetUser
                router.path.append(Screen.main)
            } else {
                showingAlert = true
                alertMessage = "비밀번호가 일치하지 않습니다"
                return
            }
        } else {
            showingAlert = true
            alertMessage = "존재하지 않는 이메일입니다"
            return
        }
    }
}

#Preview {
    LogInView()
        .environment(Router())
        .environment(UserStorage())
}
