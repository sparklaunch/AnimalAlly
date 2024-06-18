//
//  SignUp5View.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUp5View: View {
    @Environment(Router.self) private var router
    @State private var favoringWeekdays = false
    @State private var favoringWeekends = false
    @State private var favoringEvenings = false
    @State private var favoringAnimalTraining = false
    @State private var favoringEventOrganizing = false
    @State private var favoringFundraising = false
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(for: 5)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("봉사하기")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("시간대")
                        .font(.headline)
                    Text("언제 봉사하기 편하세요?")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringWeekdays)
                        Text("평일")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringWeekends)
                        Text("주말")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringEvenings)
                        Text("밤")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("기술과 관심")
                        .font(.headline)
                    Text("배우고 싶은 기술이 있나요?")
                        .font(.subheadline)
                }
                .padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        CheckBox(isChecked: $favoringAnimalTraining)
                        Text("반려 동물 훈련")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringEventOrganizing)
                        Text("이벤트 조율")
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack {
                        CheckBox(isChecked: $favoringFundraising)
                        Text("자금 모으기")
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
    }
    func goToNext() {
        UserDefaults.standard.set(favoringWeekdays, forKey: "favoringWeekdays")
        UserDefaults.standard.set(favoringWeekends, forKey: "favoringWeekends")
        UserDefaults.standard.set(favoringEvenings, forKey: "favoringEvenings")
        UserDefaults.standard.set(favoringAnimalTraining, forKey: "favoringAnimalTraining")
        UserDefaults.standard.set(favoringEventOrganizing, forKey: "favoringEventOrganizing")
        UserDefaults.standard.set(favoringFundraising, forKey: "favoringFundraising")
        router.path.append(Screen.signUpComplete)
    }
}

#Preview {
    SignUp5View()
        .environment(Router())
}
