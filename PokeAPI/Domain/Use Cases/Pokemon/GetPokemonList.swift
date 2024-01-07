//
//  GetPokemonList.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class GetPokemonList: GetPokemonListType {
    private let repository: PokemonListRepositoryType
    
    init(repository: PokemonListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<PokemonListInfoResponse, PokemonDomainError> {
        let result = await repository.getPokemonList()
        
        guard let pokemonListResult = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }
        
        return .success(pokemonListResult)
    }
}
