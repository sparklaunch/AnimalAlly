//
//  SignUpCompleteView.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/15/24.
//

import SwiftUI

struct SignUpCompleteView: View {
    @Environment(Router.self) private var router
    @Environment(UserStorage.self) private var userStorage
    private let name = UserDefaults.standard.string(forKey: "name") ?? "Anonymous"
    var body: some View {
        ZStack {
            VStack {
                Image(.signUpComplete)
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            VStack {
                Image(.satisfiedFace)
                Text("프로필 설정 완료!")
                    .font(.largeTitle)
                Text("준비되었습니다, \(name)")
                    .font(.title3)
            }
            VStack {
                Spacer()
                Button {
                    signUp()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.teal)
                            .frame(height: 50)
                            .padding()
                            .padding(.vertical, 40)
                        Text("시작")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    func signUp() {
        let user = makeUser()
        userStorage.users.append(user)
        router.path = NavigationPath()
        router.path.append(Screen.signIn)
    }
    func makeUser() -> User {
        let name = UserDefaults.standard.string(forKey: "name") ?? "Jinwook Kim"
        let emailAddress = UserDefaults.standard.string(forKey: "emailAddress") ?? "jinwookkim@gmail.com"
        let password = UserDefaults.standard.string(forKey: "password") ?? "jinwookkim123!"
        let address = UserDefaults.standard.string(forKey: "address") ?? "Seoul, Korea"
        let radius = UserDefaults.standard.double(forKey: "radius")
        let favoringAdoptingPets = UserDefaults.standard.bool(forKey: "favoringAdoptingPets")
        let favoringReportingPets = UserDefaults.standard.bool(forKey: "favoringReportingPets")
        let favoringDonating = UserDefaults.standard.bool(forKey: "favoringDonating")
        let favoringLearningPets = UserDefaults.standard.bool(forKey: "favoringLearningPets")
        let favoringVolunteering = UserDefaults.standard.bool(forKey: "favoringVolunteering")
        let favoringDogs = UserDefaults.standard.bool(forKey: "favoringDogs")
        let favoringCats = UserDefaults.standard.bool(forKey: "favoringCats")
        let favoringOthers = UserDefaults.standard.bool(forKey: "favoringOthers")
        let favoringBabies = UserDefaults.standard.bool(forKey: "favoringBabies")
        let favoringYoung = UserDefaults.standard.bool(forKey: "favoringYoung")
        let favoringAdult = UserDefaults.standard.bool(forKey: "favoringAdult")
        let favoringSenior = UserDefaults.standard.bool(forKey: "favoringSenior")
        let favoringSmall = UserDefaults.standard.bool(forKey: "favoringSmall")
        let favoringMedium = UserDefaults.standard.bool(forKey: "favoringMedium")
        let favoringLarge = UserDefaults.standard.bool(forKey: "favoringLarge")
        let favoringWeekdays = UserDefaults.standard.bool(forKey: "favoringWeekdays")
        let favoringWeekends = UserDefaults.standard.bool(forKey: "favoringWeekends")
        let favoringEvenings = UserDefaults.standard.bool(forKey: "favoringEvenings")
        let favoringAnimalTraining = UserDefaults.standard.bool(forKey: "favoringAnimalTraining")
        let favoringEventOrganizing = UserDefaults.standard.bool(forKey: "favoringEventOrganizing")
        let favoringFundraising = UserDefaults.standard.bool(forKey: "favoringFundraising")
        let favor = Favor(adoptingPets: favoringAdoptingPets, reportingPets: favoringReportingPets, donating: favoringDonating, learningPets: favoringLearningPets, volunteering: favoringVolunteering, dogs: favoringDogs, cats: favoringCats, others: favoringOthers, babies: favoringBabies, young: favoringYoung, adult: favoringAdult, senior: favoringSenior, small: favoringSmall, medium: favoringMedium, large: favoringLarge, weekdays: favoringWeekdays, weekends: favoringWeekends, evenings: favoringEvenings, animalTraining: favoringAnimalTraining, eventOrganizing: favoringEventOrganizing, fundraising: favoringFundraising)
        let user = User(name: name, emailAddress: emailAddress, password: password, address: address, radius: radius, favoriteAnimals: [], favor: favor)
        return user
    }
}

#Preview {
    SignUpCompleteView()
        .environment(Router())
        .environment(UserStorage())
}
