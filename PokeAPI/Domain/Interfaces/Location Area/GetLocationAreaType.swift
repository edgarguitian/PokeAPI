//
//  GetLocationAreaType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol GetLocationAreaType {
    func execute(url: String) async -> Result<LocationAreaInfo, PokemonDomainError>
}
