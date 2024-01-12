//
//  SwiftDataPokemonListContainerType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation

protocol SwiftDataPokemonListContainerType {
    func fetchPokemons() async -> [PokemonListData]
    func fetchPokemons(page: Int) -> [PokemonListData]
    func insert(pokemonsDataList: PokemonListData) async
    func saveData() async
}
