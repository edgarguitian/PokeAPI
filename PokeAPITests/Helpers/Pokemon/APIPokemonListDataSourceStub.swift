//
//  APIPokemonListDataSourceStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI
class APIPokemonListDataSourceStub: APIPokemonListDataSourceType {
    private let pokemonList: Result<PokeAPI.PokemonListResponseDTO, PokeAPI.HTTPClientError>
    private let pokemonListInfo: Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError>
    
    init(pokemonList: Result<PokeAPI.PokemonListResponseDTO, PokeAPI.HTTPClientError>, pokemonListInfo: Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError>) {
        self.pokemonList = pokemonList
        self.pokemonListInfo = pokemonListInfo
    }
    
    func getPokemonList() async -> Result<PokeAPI.PokemonListResponseDTO, PokeAPI.HTTPClientError> {
        return pokemonList
    }
    
    func getPokemonListInfo(url: String) async -> Result<PokeAPI.PokemonListInfoDTO, PokeAPI.HTTPClientError> {
        return pokemonListInfo
    }
    
    
}
