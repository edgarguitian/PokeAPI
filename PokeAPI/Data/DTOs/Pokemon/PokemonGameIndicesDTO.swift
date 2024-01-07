//
//  PokemonGameIndicesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonGameIndicesDTO: Decodable {
    let gameIndex: Int
    let version: NameUrlDTO
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}
