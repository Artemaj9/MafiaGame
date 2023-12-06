//
//  DallEModel.swift
//

import Foundation

struct DallEModel: Codable {
    let created: Int
    let data: [ImageURL]
}

struct ImageURL: Codable {
    let url: String
}
