//
//  SinglePokemonRepositoryType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

protocol SinglePokemonRepositoryType {
    func getPokemonInfo(pokemonId: String) async -> Result<SinglePokemonInfo, PokemonDomainError>
}
