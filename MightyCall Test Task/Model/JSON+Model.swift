//
//  JSON+Model.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import Foundation

// main response object
struct Client: Codable {
    let id: String
    let state: String
    let client: ClientPersonalInfo
    let type: String
    let created: String
    let businessNumber: BusinessNumber
    let origin: String
    let favorite: Bool
    let duration: String
}

// nested client object
struct ClientPersonalInfo: Codable {
    let address: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case address
        case name = "Name"
    }
}

// nested businnesNumber object
struct BusinessNumber: Codable {
    let number: String
    let label: String
}
