//
//  PokemonListInfoResponseDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonListInfoResponseDTO: Decodable {
    let results: [PokemonListInfoDTO]

}
