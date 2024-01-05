//
//  PokemonEntryDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonEntryDTO: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
