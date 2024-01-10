//
//  GetSingleLocation.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class GetSingleLocation: GetSingleLocationType {
    private let repository: SingleLocationRepositoryType

    init(repository: SingleLocationRepositoryType) {
        self.repository = repository
    }

    func execute(url: String) async -> Result<SingleLocationInfo, PokemonDomainError> {
        let result = await repository.getLocationInfo(url: url)

        guard let locationResult = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }

        return .success(locationResult)
    }
}
