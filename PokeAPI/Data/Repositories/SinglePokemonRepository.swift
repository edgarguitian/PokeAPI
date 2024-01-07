//
//  SinglePokemonRepository.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class SinglePokemonRepository: SinglePokemonRepositoryType {

    private let apiDataSource: APISinglePokemonDataSourceType
    private let errorMapper: PokemonDomainErrorMapper
    
    init(apiDataSource: APISinglePokemonDataSourceType,
         errorMapper: PokemonDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getPokemonInfo(pokemonId: String) async -> Result<SinglePokemonInfo, PokemonDomainError> {
        let pokemonResponse = await apiDataSource.getPokemonInfo(pokemonId: pokemonId)
        
        guard case .success(let pokemonListInfo) = pokemonResponse else {
            return .failure(errorMapper.map(error: pokemonResponse.failureValue as? HTTPClientError))
        }
               
        return .success(SinglePokemonInfo(response: pokemonListInfo))
    }
    
}
