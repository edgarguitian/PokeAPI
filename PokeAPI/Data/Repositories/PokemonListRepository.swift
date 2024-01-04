//
//  PokemonListRepository.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonListRepository: PokemonListRepositoryType {

    private let apiDataSource: APIPokemonListDataSourceType
    private let errorMapper: PokemonDomainErrorMapper
    
    init(apiDataSource: APIPokemonListDataSourceType, errorMapper: PokemonDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getPokemonList() async -> Result<PokemonListResponse, PokemonDomainError> {
        <#code#>
    }
    
}
