//
//  DataModel.swift
//  Vinfo
//
//  Created by Mai Duong on 29/06/2022.
//

import Foundation

struct DataModel: Codable {
    let status: Int
    let data: AccountData
}

struct AccountData: Codable {
    let puuid: String
    let region: String
    let account_level: Int
    let name: String
    let tag: String
    let card: CardImage
    let last_update: String
}

struct CardImage: Codable {
    let small: String
    let large: String
    let wide: String
    let id: String
}
