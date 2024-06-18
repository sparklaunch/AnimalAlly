//
//  SignUp1View.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUp1View: View {
    @Environment(Router.self) private var router
    @State private var name = "Jinwook Kim"
    @State private var emailAddress = "jinwookkim@gmail.com"
    @State private var password = "jinwookkim123!"
    @State private var isPasswordVisible = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(for: 1)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("계정 설정")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("성함")
                    TextField("성함", text: $name)
                        .textContentType(.name)
                        .textFieldStyle(CustomTextFieldStyle(type: .none, isVisible: .constant(true)))
                }
                .padding([.horizontal, .bottom])
                VStack(alignment: .leading) {
                    Text("이메일")
                    TextField("이메일", text: $emailAddress)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(CustomTextFieldStyle(type: .emailAddress, isVisible: .constant(true)))
                        .textInputAutocapitalization(.never)
                }
                .padding([.horizontal, .bottom])
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    if isPasswordVisible {
                        TextField("비밀번호", text: $password)
                            .textContentType(.password)
                            .textFieldStyle(CustomTextFieldStyle(type: .password(isVisible: isPasswordVisible), isVisible: $isPasswordVisible))
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("비밀번호", text: $password)
                            .textContentType(.password)
                            .textFieldStyle(CustomTextFieldStyle(type: .password(isVisible: isPasswordVisible), isVisible: $isPasswordVisible))
                            .textInputAutocapitalization(.never)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            VStack {
                Spacer()
                Button {
                    goToNext()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.teal)
                            .frame(height: 50)
                            .padding()
                        Text("다음")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .alert("오류", isPresented: $showingAlert) {
            Button("확인") {}
        } message: {
            Text(alertMessage)
        }
    }
    func goToNext() {
        if name.isEmpty {
            showingAlert = true
            alertMessage = "이름을 입력해주세요"
            return
        }
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
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(emailAddress, forKey: "emailAddress")
        UserDefaults.standard.set(password, forKey: "password")
        router.path.append(Screen.signUp2)
    }
}

#Preview {
    SignUp1View()
        .environment(Router())
}
