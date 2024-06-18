//
//  SignUp4View.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUp4View: View {
    @Environment(Router.self) private var router
    @State private var address = "Jinwook Street"
    @State private var radius = 23.0
    @State private var showingAlert = false
    @State private var alertMessage = ""
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(for: 4)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("주소와 접근 가능성")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("주소")
                        .font(.headline)
                    Text("사는 곳이 어디세요?")
                        .font(.subheadline)
                }
                .padding(.horizontal)
                VStack {
                    TextField("주소", text: $address)
                        .textContentType(.addressCityAndState)
                        .textFieldStyle(CustomTextFieldStyle(type: .none, isVisible: .constant(true)))
                }
                .padding(.bottom, 10)
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("반경")
                        .font(.headline)
                    Text("얼마나 멀리 반려 동물을 입양하거나 봉사하기 위해 올 수 있나요?")
                        .font(.subheadline)
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Slider(value: $radius, in: 0...100, step: 1)
                        .tint(.teal)
                    Text("\(radius.formatted())km")
                }
                .padding(.bottom, 10)
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
        if address.isEmpty {
            showingAlert = true
            alertMessage = "주소를 입력해주세요"
            return
        }
        UserDefaults.standard.set(address, forKey: "address")
        UserDefaults.standard.set(radius, forKey: "radius")
        router.path.append(Screen.signUp5)
    }
}

#Preview {
    SignUp4View()
        .environment(Router())
}
