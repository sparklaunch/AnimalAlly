//
//  FoundAndLostFormView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct FoundAndLostFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var animalStatus = AnimalStatus.found
    @State private var animalType = AnimalType.dog
    @State private var description = ""
    @State private var dateAndTime = Date.now
    @State private var phoneNumber = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showingSuccessAlert = false
    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                Button {
                    animalStatus = .found
                } label: {
                    Image(.found)
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: .bottomLeading) {
                            Text("찾음")
                                .padding()
                        }
                        .background(alignment: .center) {
                            if animalStatus == .found {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .stroke(.teal, lineWidth: 5)
                            }
                        }
                }
                .foregroundStyle(.white)
                Button {
                    animalStatus = .lost
                } label: {
                    Image(.lost)
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: .bottomLeading) {
                            Text("잃음")
                                .padding()
                        }
                        .background(alignment: .center) {
                            if animalStatus == .lost {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .stroke(.teal, lineWidth: 5)
                            }
                        }
                }
                .foregroundStyle(.white)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("동물의 종류")
                    .font(.title3)
                Picker("타입", selection: $animalType) {
                    Text("개")
                        .tag(AnimalType.dog)
                    Text("고양이")
                        .tag(AnimalType.cat)
                    Text("기타")
                        .tag(AnimalType.others)
                }
                .tint(.teal)
            }
            .padding(.horizontal)
            VStack(alignment: .leading) {
                Text("상세 정보")
                TextField("상세 정보", text: $description, axis: .vertical)
                    .textFieldStyle(CustomTextFieldStyle(type: .none, isVisible: .constant(true)))
            }
            .padding([.horizontal, .bottom])
            VStack(alignment: .leading) {
                Text("날짜와 시간")
                DatePicker("날짜와 시간", selection: $dateAndTime, in: ...Date.now)
                    .labelsHidden()
            }
            .padding([.horizontal, .bottom])
            VStack(alignment: .leading) {
                Text("연락 가능한 번호")
                TextField("전화 번호", text: $phoneNumber, axis: .vertical)
                    .textFieldStyle(CustomTextFieldStyle(type: .none, isVisible: .constant(true)))
                    .textContentType(.telephoneNumber)
                    .keyboardType(.numberPad)
            }
            .padding([.horizontal, .bottom])
            Spacer()
            Button("제출하기") {
                submit()
            }
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("분실 동물 신고")
        .alert("오류", isPresented: $showingAlert) {
            Button("확인") {}
        } message: {
            Text(alertMessage)
        }
        .alert("제출 완료", isPresented: $showingSuccessAlert) {
            Button("확인") {
                dismiss()
            }
        } message: {
            Text("\(animalStatus == .found ? "찾은" : "잃은") 동물 신고서가 정상적으로 제출되었습니다")
        }
    }
    func submit() {
        if phoneNumber.isEmpty {
            showingAlert = true
            alertMessage = "연락 가능한 전화 번호를 입력해주세요"
            return
        }
        showingSuccessAlert = true
    }
}

#Preview {
    FoundAndLostFormView()
}
