//
//  APIPokemonListDataSourceType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

protocol APIPokemonListDataSourceType {
    func getPokemonList() async -> Result<PokemonListResponseDTO, HTTPClientError>
    func getPokemonListInfo(url: String) async -> Result<PokemonListInfoDTO, HTTPClientError>
}
