//
//  PokemonListResponseDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

struct PokemonListResponseDTO: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
