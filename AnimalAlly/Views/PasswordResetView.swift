//
//  PasswordResetView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct PasswordResetView: View {
    @Environment(UserStorage.self) private var userStorage
    @Environment(Router.self) private var router
    @State private var currentPassword = ""
    @State private var newPasswordConfirmation = ""
    @State private var newPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showingSuccessAlert = false
    @State private var successAlertMessage = ""
    private var currentUser: User {
        guard let currentUser = userStorage.currentUser else {
            fatalError("Failed to find current user")
        }
        return currentUser
    }
    var body: some View {
        Form {
            Section("현재 비밀번호") {
                SecureField("현재 비밀번호", text: $currentPassword)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
            }
            Section("새로운 비밀번호") {
                SecureField("새로운 비밀번호", text: $newPassword)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
            }
            Section("새로운 비밀번호 확인") {
                SecureField("새로운 비밀번호", text: $newPasswordConfirmation)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
            }
            Button("비밀번호 재설정") {
                resetPassword()
            }
        }
        .navigationTitle("비밀번호 재설정")
        .alert("오류", isPresented: $showingAlert) {
            Button("확인") {}
        } message: {
            Text(alertMessage)
        }
        .alert("성공", isPresented: $showingSuccessAlert) {
            Button("확인") {
                router.path = NavigationPath()
                router.path.append(Screen.signIn)
            }
        } message: {
            Text("비밀번호를 재설정하였습니다. 다시 로그인해주세요")
        }
    }
    func resetPassword() {
        if currentPassword.isEmpty {
            showingAlert = true
            alertMessage = "현재 비밀번호를 입력해주세요"
            return
        }
        if newPassword.isEmpty {
            showingAlert = true
            alertMessage = "새로운 비밀번호를 입력해주세요"
            return
        }
        if newPasswordConfirmation.isEmpty {
            showingAlert = true
            alertMessage = "새로운 비밀번호를 한번 더 입력해주세요"
            return
        }
        if currentPassword != currentUser.password {
            showingAlert = true
            alertMessage = "현재 비밀번호가 일치하지 않습니다"
            return
        }
        if newPassword != newPasswordConfirmation {
            showingAlert = true
            alertMessage = "새로운 비밀번호가 일치하지 않습니다"
            return
        }
        userStorage.currentUser?.password = newPassword
        showingSuccessAlert = true
    }
}

