//
//  PokemonListInfoResponse.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

class PokemonListInfoResponse {
    let results: [PokemonListInfo]
    
    init(results: [PokemonListInfo]) {
        self.results = results
    }
}
