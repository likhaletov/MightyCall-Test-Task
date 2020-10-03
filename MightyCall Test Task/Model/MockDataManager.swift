//
//  MockDataManager.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 03.10.2020.
//

import Foundation

struct Record {
    let name: String
    let description: String?
    let duration: String
    let date: String
}

class MockDataManager {
    static func getMockData() -> [Record] {
        let array =  [
            Record(name: "+1 800 123-4567", description: nil ?? "", duration: "00:13", date: "10:21 AM"),
            Record(name: "Tag of business number...", description: "+1 800 123-4567", duration: "00:13", date: "10:21 AM")
        ]
        return array
    }
}
