//
//  PokemonTypesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonTypesDTO: Decodable {
    let slot: Int
    let type: PokemonNameUrlDTO
    
    enum CodingKeys: String, CodingKey {
        case slot, type
    }
}
