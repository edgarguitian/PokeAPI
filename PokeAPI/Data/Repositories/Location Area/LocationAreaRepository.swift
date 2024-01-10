//
//  LocationAreaRepository.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class LocationAreaRepository: LocationAreaRepositoryType {

    private let apiDataSource: APILocationAreaDataSourceType
    private let errorMapper: PokemonDomainErrorMapper

    init(apiDataSource: APILocationAreaDataSourceType,
         errorMapper: PokemonDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }

    func getLocationArea(url: String) async -> Result<LocationAreaInfo, PokemonDomainError> {
        let locationAreaResponse = await apiDataSource.getLocationInfo(url: url)

        guard case .success(let locationInfo) = locationAreaResponse else {
            return .failure(errorMapper.map(error: locationAreaResponse.failureValue as? HTTPClientError))
        }

        return .success(LocationAreaInfo(response: locationInfo))
    }

}
