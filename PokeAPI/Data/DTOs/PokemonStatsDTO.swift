//
//  PokemonStatsDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct PokemonStatsDTO: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: PokemonNameUrlDTO
    
    enum CodingKeys: String, CodingKey {
        case effort, stat
        case baseStat = "base_stat"
    }
}
