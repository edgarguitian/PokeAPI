//
//  PokemonMovesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonMovesDTO: Decodable {
    let move: NameUrlDTO
    let versionGroupDetails: [PokemonMoveVersionGroupDetailsDTO]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}
