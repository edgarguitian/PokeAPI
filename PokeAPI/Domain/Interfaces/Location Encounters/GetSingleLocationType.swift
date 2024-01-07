//
//  GetSingleLocationType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol GetSingleLocationType {
    func execute(url: String) async -> Result<SingleLocationInfo, PokemonDomainError>
}
