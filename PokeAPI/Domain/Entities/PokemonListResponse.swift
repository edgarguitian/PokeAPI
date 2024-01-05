//
//  PokemonListResponse.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonListResponse {
    let results: [PokemonEntry]
    
    init(results: [PokemonEntry]) {
        self.results = results
    }
}
