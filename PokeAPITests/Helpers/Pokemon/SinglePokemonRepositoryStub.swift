//
//  SinglePokemonRepositoryStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class SinglePokemonRepositoryStub: SinglePokemonRepositoryType {

    private let result: Result<PokeAPI.SinglePokemonInfo, PokeAPI.PokemonDomainError>

    init(result: Result<PokeAPI.SinglePokemonInfo, PokeAPI.PokemonDomainError>) {
        self.result = result
    }

    func getPokemonInfo(pokemonId: String) async -> Result<PokeAPI.SinglePokemonInfo, PokeAPI.PokemonDomainError> {
        return result
    }

}
