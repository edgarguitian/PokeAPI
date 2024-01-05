//
//  PokemonListInfoDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonListInfoDTO: Decodable {
    let id: Int
    let name: String
    let sprites: PokemonSpritesDTO
    
    enum CodingKeys: String, CodingKey {
        case id, name, sprites
    }
}
