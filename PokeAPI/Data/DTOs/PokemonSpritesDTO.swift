//
//  PokemonSpritesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonSpritesDTO: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
