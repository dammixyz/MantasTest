//
//  UserInfo.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import Foundation

struct UserInfo: Codable, Hashable {
    let results: [Result]
}

struct UsersInfo: Codable, Hashable {
    let users: [UserInfo]
}
