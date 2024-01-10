//
//  LocationAreaFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class LocationAreaFactory: CreateLocationAreaView {
    func create(url: String) -> LocationAreaView {
        return LocationAreaView(viewModel: createViewModel(url: url))
    }

    func createViewModel(url: String) -> LocationAreaViewModel {
        return LocationAreaViewModel(url: url,
                                     getLocationArea: createUseCase(),
                                     errorMapper: PokemonPresentableErrorMapper())
    }

    private func createUseCase() -> GetLocationAreaType {
        return GetLocationArea(repository: createRepository())
    }

    private func createRepository() -> LocationAreaRepositoryType {
        return LocationAreaRepository(apiDataSource: createAPIDataSource(),
                                      errorMapper: PokemonDomainErrorMapper())
    }

    private func createAPIDataSource() -> APILocationAreaDataSourceType {
        return APILocationAreaDataSource(httpClient: LocationAreaFactory.createHTTPClient())
    }

    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }

}
