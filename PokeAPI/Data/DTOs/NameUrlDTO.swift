//
//  NameUrlDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct NameUrlDTO: Decodable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
