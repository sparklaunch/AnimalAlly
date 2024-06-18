//
//  Favor.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/16/24.
//

import Foundation

struct Favor: Identifiable, Codable, Hashable {
    static let example = Favor(adoptingPets: true, reportingPets: true, donating: false, learningPets: false, volunteering: false, dogs: true, cats: true, others: true, babies: true, young: true, adult: false, senior: false, small: false, medium: true, large: true, weekdays: false, weekends: true, evenings: true, animalTraining: false, eventOrganizing: false, fundraising: false)
    var id = UUID()
    let adoptingPets: Bool
    let reportingPets: Bool
    let donating: Bool
    let learningPets: Bool
    let volunteering: Bool
    let dogs: Bool
    let cats: Bool
    let others: Bool
    let babies: Bool
    let young: Bool
    let adult: Bool
    let senior: Bool
    let small: Bool
    let medium: Bool
    let large: Bool
    let weekdays: Bool
    let weekends: Bool
    let evenings: Bool
    let animalTraining: Bool
    let eventOrganizing: Bool
    let fundraising: Bool
}
