//
//  PokemonHeldItemsDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonHeldItemsDTO: Decodable {
    let item: NameUrlDTO
    let versionDetails: [PokemonHeldItemVersionDetailsDTO]
    
    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}
