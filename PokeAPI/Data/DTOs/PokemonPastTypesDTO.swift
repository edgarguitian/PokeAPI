//
//  PokemonPastTypesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonPastTypesDTO: Decodable {
    let generation: PokemonNameUrlDTO
    let types: [PokemonTypesDTO]
    
    enum CodingKeys: String, CodingKey {
        case generation, types
    }
}
