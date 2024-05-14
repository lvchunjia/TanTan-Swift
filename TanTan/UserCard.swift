//
//  UserCard.swift
//  TanTan
//
//  Created by 中律十七 on 2024/5/14.
//

import Foundation

struct UserCard: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let place: String
    let zodiac: String
    let photos: [String]
}
