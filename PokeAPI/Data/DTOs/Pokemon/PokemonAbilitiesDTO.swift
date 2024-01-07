//
//  PokemonAbilitiesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonAbilitiesDTO: Decodable {
    let isHidden: Bool
    let slot: Int
    let ability: NameUrlDTO
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot, ability
    }
}
