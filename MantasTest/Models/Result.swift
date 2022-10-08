//
//  Result.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import Foundation

struct Result: Codable, Hashable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let picture: Picture
}
