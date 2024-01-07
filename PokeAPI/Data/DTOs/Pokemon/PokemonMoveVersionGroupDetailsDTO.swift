//
//  PokemonMoveVersionGroupDetailsDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonMoveVersionGroupDetailsDTO: Decodable {
    let levelLearnedAt: Int
    let versionGroup: NameUrlDTO
    let moveLearnMethod: NameUrlDTO
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup = "version_group"
        case moveLearnMethod = "move_learn_method"
    }
}
