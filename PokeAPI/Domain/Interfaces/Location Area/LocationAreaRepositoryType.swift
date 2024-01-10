//
//  LocationAreaRepositoryType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol LocationAreaRepositoryType {
    func getLocationArea(url: String) async -> Result<LocationAreaInfo, PokemonDomainError>
}
