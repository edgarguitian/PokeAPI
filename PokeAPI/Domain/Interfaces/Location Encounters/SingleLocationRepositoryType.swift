//
//  SingleLocationRepositoryType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol SingleLocationRepositoryType {
    func getLocationInfo(url: String) async -> Result<SingleLocationInfo, PokemonDomainError>
}
