//
//  User.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 09/02/2023.
//

import Foundation

enum Gender {
    case female, male
}

struct User: Hashable {
    var id = UUID()
    var firstname: String
    var lastname: String
    var nickname: String?
    var age: Int
    var gender: Gender?
    var avatar: String
}
