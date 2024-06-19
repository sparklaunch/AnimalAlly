//
//  PetPreferencesView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/19/24.
//

import SwiftUI

struct PetPreferencesView: View {
    @Environment(UserStorage.self) private var userStorage
    @State private var adoptingPets = false
    @State private var reportingPets = false
    @State private var donating = false
    @State private var learningPets = false
    @State private var volunteering = false
    @State private var favoringDogs = false
    @State private var favoringCats = false
    @State private var favoringOthers = false
    @State private var favoringBabies = false
    @State private var favoringYoung = false
    @State private var favoringAdult = false
    @State private var favoringSenior = false
    @State private var favoringSmall = false
    @State private var favoringMedium = false
    @State private var favoringLarge = false
    @State private var weekdays = false
    @State private var weekends = false
    @State private var evenings = false
    @State private var animalTraining = false
    @State private var eventOrganizing = false
    @State private var fundraising = false
    var body: some View {
        List {
            Section("좋아하는 것") {
                Toggle("동물 입양하기", isOn: $adoptingPets.onChange(perform: saveChanges))
                Toggle("동물 신고하기", isOn: $reportingPets.onChange(perform: saveChanges))
                Toggle("기부하기", isOn: $donating.onChange(perform: saveChanges))
                Toggle("동물에 대해 배우기", isOn: $learningPets.onChange(perform: saveChanges))
                Toggle("봉사하기", isOn: $volunteering.onChange(perform: saveChanges))
            }
            Section("선호하는 동물") {
                Toggle("개", isOn: $favoringDogs.onChange(perform: saveChanges))
                Toggle("고양이", isOn: $favoringCats.onChange(perform: saveChanges))
                Toggle("기타", isOn: $favoringOthers.onChange(perform: saveChanges))
            }
            Section("선호하는 연령 범위") {
                Toggle("강아지/고양이", isOn: $favoringBabies.onChange(perform: saveChanges))
                Toggle("유견/유묘", isOn: $favoringYoung.onChange(perform: saveChanges))
                Toggle("성견/성묘", isOn: $favoringAdult.onChange(perform: saveChanges))
                Toggle("노견/노묘", isOn: $favoringSenior.onChange(perform: saveChanges))
            }
            Section("선호하는 크기") {
                Toggle("소형", isOn: $favoringSmall.onChange(perform: saveChanges))
                Toggle("중형", isOn: $favoringMedium.onChange(perform: saveChanges))
                Toggle("대형", isOn: $favoringLarge.onChange(perform: saveChanges))
            }
            Section("봉사 시간대") {
                Toggle("평일", isOn: $weekdays.onChange(perform: saveChanges))
                Toggle("주말", isOn: $weekends.onChange(perform: saveChanges))
                Toggle("밤", isOn: $evenings.onChange(perform: saveChanges))
            }
            Section("배우고 싶은 기술") {
                Toggle("동물 훈련", isOn: $animalTraining.onChange(perform: saveChanges))
                Toggle("행사 주최", isOn: $eventOrganizing.onChange(perform: saveChanges))
                Toggle("모금", isOn: $fundraising.onChange(perform: saveChanges))
            }
        }
        .navigationTitle("반려 동물 선호")
        .onAppear {
            initializeToggles()
        }
    }
    func initializeToggles() {
        adoptingPets = userStorage.currentUser?.favor.adoptingPets ?? false
        reportingPets = userStorage.currentUser?.favor.reportingPets ?? false
        donating = userStorage.currentUser?.favor.donating ?? false
        learningPets = userStorage.currentUser?.favor.learningPets ?? false
        volunteering = userStorage.currentUser?.favor.volunteering ?? false
        favoringDogs = userStorage.currentUser?.favor.dogs ?? false
        favoringCats = userStorage.currentUser?.favor.cats ?? false
        favoringOthers = userStorage.currentUser?.favor.others ?? false
        favoringBabies = userStorage.currentUser?.favor.babies ?? false
        favoringYoung = userStorage.currentUser?.favor.young ?? false
        favoringAdult = userStorage.currentUser?.favor.adult ?? false
        favoringSenior = userStorage.currentUser?.favor.senior ?? false
        favoringSmall = userStorage.currentUser?.favor.small ?? false
        favoringMedium = userStorage.currentUser?.favor.medium ?? false
        favoringLarge = userStorage.currentUser?.favor.large ?? false
        weekdays = userStorage.currentUser?.favor.weekdays ?? false
        weekends = userStorage.currentUser?.favor.weekends ?? false
        evenings = userStorage.currentUser?.favor.evenings ?? false
        animalTraining = userStorage.currentUser?.favor.animalTraining ?? false
        eventOrganizing = userStorage.currentUser?.favor.eventOrganizing ?? false
        fundraising = userStorage.currentUser?.favor.fundraising ?? false
    }
    func saveChanges() {
        let newFavor = Favor(adoptingPets: adoptingPets, reportingPets: reportingPets, donating: donating, learningPets: learningPets, volunteering: volunteering, dogs: favoringDogs, cats: favoringCats, others: favoringOthers, babies: favoringBabies, young: favoringYoung, adult: favoringAdult, senior: favoringSenior, small: favoringSmall, medium: favoringMedium, large: favoringLarge, weekdays: weekdays, weekends: weekends, evenings: evenings, animalTraining: animalTraining, eventOrganizing: eventOrganizing, fundraising: fundraising)
        userStorage.currentUser?.favor = newFavor
    }
}

#Preview {
    PetPreferencesView()
        .environment(UserStorage())
}
