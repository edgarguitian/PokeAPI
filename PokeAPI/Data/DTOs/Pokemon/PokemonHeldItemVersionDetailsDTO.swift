//
//  PokemonHeldItemVersionDetailsDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonHeldItemVersionDetailsDTO: Decodable {
    let rarity: Int
    let version: NameUrlDTO

    enum CodingKeys: String, CodingKey {
        case rarity, version
    }
}
