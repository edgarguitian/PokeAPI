//
//  LocationAreaRepositoryStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class LocationAreaRepositoryStub: LocationAreaRepositoryType {

    private let result: Result<LocationAreaInfo, PokemonDomainError>

    init(result: Result<LocationAreaInfo, PokemonDomainError>) {
        self.result = result
    }

    func getLocationArea(url: String) async -> Result<LocationAreaInfo, PokemonDomainError> {
        return result
    }

}
