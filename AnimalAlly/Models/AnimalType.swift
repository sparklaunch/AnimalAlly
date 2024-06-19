//
//  AnimalType.swift
//  AnimalAlly
//
//  Created by Jinwook Kim on 6/18/24.
//

import Foundation

enum AnimalType: String, CaseIterable, Codable {
    case all = "모두"
    case dog = "개"
    case cat = "고양이"
    case others = "기타"
}
