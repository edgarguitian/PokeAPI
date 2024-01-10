//
//  SingleLocationRepository.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class SingleLocationRepository: SingleLocationRepositoryType {

    private let apiDataSource: APISingleLocationDataSourceType
    private let errorMapper: PokemonDomainErrorMapper

    init(apiDataSource: APISingleLocationDataSourceType,
         errorMapper: PokemonDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }

    func getLocationInfo(url: String) async -> Result<SingleLocationInfo, PokemonDomainError> {
        let locationResponse = await apiDataSource.getLocationInfo(url: url)

        guard case .success(let locationInfo) = locationResponse else {
            return .failure(errorMapper.map(error: locationResponse.failureValue as? HTTPClientError))
        }

        return .success(SingleLocationInfo(response: locationInfo))
    }

}
