//
//  APISinglePokemonDataSourceStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class APISinglePokemonDataSourceStub: APISinglePokemonDataSourceType {
    private let pokemonList: Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError>
    
    init(pokemonList: Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError>) {
        self.pokemonList = pokemonList
    }
    
    func getPokemonInfo(pokemonId: String) async -> Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError> {
        return pokemonList
    }
    
    
}
