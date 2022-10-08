//
//  Location.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import Foundation

struct Location: Codable, Hashable {
    let street: Street
    let city, state, country: String
}

