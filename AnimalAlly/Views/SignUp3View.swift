//
//  SignUp3View.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUp3View: View {
    @Environment(Router.self) private var router
    @State private var favoringDogs = true
    @State private var favoringCats = false
    @State private var favoringOthers = false
    @State private var favoringBabies = true
    @State private var favoringYoung = false
    @State private var favoringAdult = false
    @State private var favoringSenior = false
    @State private var favoringSmall = false
    @State private var favoringMedium = false
    @State private var favoringLarge = true
    @State private var showingAlert = false
    @State private var alertMessage = ""
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(for: 3)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("선호하는 반려 동물")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("선호하는 동물")
                        .font(.headline)
                    Text("어떤 반려 동물을 입양하길 원하시나요?")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringDogs)
                        Text("개")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringCats)
                        Text("고양이")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringOthers)
                        Text("기타")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("연령 범위")
                        .font(.headline)
                    Text("연령의 범위는 어떻게 되나요?")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringBabies)
                        Text("강아지/고양이")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringYoung)
                        Text("유견/유묘")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringAdult)
                        Text("성견/성묘")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringSenior)
                        Text("노견/노묘")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("크기")
                        .font(.headline)
                    Text("크기는 어떻게 되나요?")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringSmall)
                        Text("작음")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringMedium)
                        Text("중간")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringLarge)
                        Text("큼")
                        Spacer()
                    }
                    .padding(.bottom, 10)
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
        if [favoringDogs, favoringCats, favoringOthers].allSatisfy({ $0 == false }) {
            showingAlert = true
            alertMessage = "선호하는 동물을 적어도 하나 선택하세요"
            return
        }
        if [favoringBabies, favoringYoung, favoringAdult, favoringSenior].allSatisfy({ $0 == false }) {
            showingAlert = true
            alertMessage = "연령의 범위를 적어도 하나 선택하세요"
            return
        }
        if [favoringSmall, favoringMedium, favoringLarge].allSatisfy({ $0 == false }) {
            showingAlert = true
            alertMessage = "크기를 적어도 하나 선택하세요"
            return
        }
        UserDefaults.standard.set(favoringDogs, forKey: "favoringDogs")
        UserDefaults.standard.set(favoringCats, forKey: "favoringCats")
        UserDefaults.standard.set(favoringOthers, forKey: "favoringOthers")
        UserDefaults.standard.set(favoringBabies, forKey: "favoringBabies")
        UserDefaults.standard.set(favoringYoung, forKey: "favoringYoung")
        UserDefaults.standard.set(favoringAdult, forKey: "favoringAdult")
        UserDefaults.standard.set(favoringSenior, forKey: "favoringSenior")
        UserDefaults.standard.set(favoringSmall, forKey: "favoringSmall")
        UserDefaults.standard.set(favoringMedium, forKey: "favoringMedium")
        UserDefaults.standard.set(favoringLarge, forKey: "favoringLarge")
        router.path.append(Screen.signUp4)
    }
}

#Preview {
    SignUp3View()
        .environment(Router())
}
