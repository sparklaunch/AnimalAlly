//
//  SignUp2View.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUp2View: View {
    @Environment(Router.self) private var router
    @State private var favoringAdoptingPets = false
    @State private var favoringReportingPets = false
    @State private var favoringDonating = false
    @State private var favoringLearningPets = false
    @State private var favoringVolunteering = false
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(for: 2)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("좋아하는 것")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("동물에 대한 관심")
                        .font(.headline)
                    Text("해당되는 항목을 모두 선택해주세요")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringAdoptingPets)
                        Text("반려 동물 입양하기")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringReportingPets)
                        Text("유기 동물 신고하기")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringDonating)
                        Text("동물 보호 단체에 기부하기")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringLearningPets)
                        Text("반려 동물 돌보는 법 배우기")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringVolunteering)
                        Text("동물 보호 센터에서 자원 봉사 하기")
                        Spacer()
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
    }
    func goToNext() {
        UserDefaults.standard.set(favoringAdoptingPets, forKey: "favoringAdoptingPets")
        UserDefaults.standard.set(favoringReportingPets, forKey: "favoringReportingPets")
        UserDefaults.standard.set(favoringDonating, forKey: "favoringDonating")
        UserDefaults.standard.set(favoringLearningPets, forKey: "favoringLearningPets")
        UserDefaults.standard.set(favoringVolunteering, forKey: "favoringVolunteering")
        router.path.append(Screen.signUp3)
    }
}

#Preview {
    SignUp2View()
        .environment(Router())
}
