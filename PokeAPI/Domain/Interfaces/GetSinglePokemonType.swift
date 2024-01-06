//
//  GetSinglePokemonType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

protocol GetSinglePokemonType {
    func execute(pokemonId: String) async -> Result<SinglePokemonInfo, PokemonDomainError>
}
