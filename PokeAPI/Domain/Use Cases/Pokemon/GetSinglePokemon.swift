//
//  GetSinglePokemon.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class GetSinglePokemon: GetSinglePokemonType {
    private let repository: SinglePokemonRepositoryType
    
    init(repository: SinglePokemonRepositoryType) {
        self.repository = repository
    }
    
    func execute(pokemonId: String) async -> Result<SinglePokemonInfo, PokemonDomainError> {
        let result = await repository.getPokemonInfo(pokemonId: pokemonId)
        
        guard let pokemonResult = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }
        
        return .success(pokemonResult)
    }
}
