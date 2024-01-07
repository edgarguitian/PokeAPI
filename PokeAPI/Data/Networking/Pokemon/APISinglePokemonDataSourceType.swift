//
//  APISinglePokemonDataSourceType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

protocol APISinglePokemonDataSourceType {
    func getPokemonInfo(pokemonId: String) async -> Result<PokemonListInfoDTO, HTTPClientError>
}
