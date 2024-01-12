//
//  CachePokemonListDataSourceType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation

protocol CachePokemonListDataSourceType {
    func getPokemonsList(page: Int) async -> PokemonListInfoResponse
    func savePokemonsList(_ pokemonsList: PokemonListInfoResponse, page: Int) async
}
