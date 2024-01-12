//
//  SingleLocationRepositoryStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class SingleLocationRepositoryStub: SingleLocationRepositoryType {

    private let result: Result<SingleLocationInfo, PokemonDomainError>

    init(result: Result<SingleLocationInfo, PokemonDomainError>) {
        self.result = result
    }

    func getLocationInfo(url: String) async -> Result<SingleLocationInfo, PokemonDomainError> {
        return result
    }

}
