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
    private let domainMapper: SinglePokemonDomainMapper
    
    init(apiDataSource: APISinglePokemonDataSourceType,
         errorMapper: PokemonDomainErrorMapper,
         domainMapper: SinglePokemonDomainMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getPokemonInfo(pokemonId: String) async -> Result<SinglePokemonInfo, PokemonDomainError> {
        let pokemonResponse = await apiDataSource.getPokemonInfo(pokemonId: pokemonId)
        
        guard case .success(let pokemonListInfo) = pokemonResponse else {
            return .failure(errorMapper.map(error: pokemonResponse.failureValue as? HTTPClientError))
        }
        
        let pokemonDomain = domainMapper.map(domain: pokemonListInfo)
       
        return .success(pokemonDomain)
    }
    
}
