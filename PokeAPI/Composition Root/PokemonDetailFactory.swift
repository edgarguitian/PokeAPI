//
//  PokemonDetailFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class PokemonDetailFactory: CreatePokemonDetailView {
    func create(pokemonId: String) -> PokemonDetailView {
        return PokemonDetailView(viewModel: createViewModel(pokemonId: pokemonId),
                                 createLocationAreaView: LocationAreaFactory())
    }

    func createViewModel(pokemonId: String) -> PokemonDetailViewModel {
        return PokemonDetailViewModel(pokemonId: pokemonId,
                                      getSinglePokemon: createPokemonUseCase(),
                                      getSingleLocation: createLocationUseCase(),
                                      errorMapper: PokemonPresentableErrorMapper())
    }

    private func createPokemonUseCase() -> GetSinglePokemonType {
        return GetSinglePokemon(repository: createRepository())
    }

    private func createRepository() -> SinglePokemonRepositoryType {
        return SinglePokemonRepository(apiDataSource: createAPIPokemonDataSource(),
                                       errorMapper: PokemonDomainErrorMapper())
    }

    private func createAPIPokemonDataSource() -> APISinglePokemonDataSourceType {
        return APISinglePokemonDataSource(httpClient: PokemonDetailFactory.createHTTPClient())
    }

    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }

    private func createLocationUseCase() -> GetSingleLocationType {
        return GetSingleLocation(repository: createLocationRepository())
    }

    private func createLocationRepository() -> SingleLocationRepositoryType {
        return SingleLocationRepository(apiDataSource: createAPILocationDataSource(),
                                       errorMapper: PokemonDomainErrorMapper())
    }

    private func createAPILocationDataSource() -> APISingleLocationDataSourceType {
        return APISingleLocationDataSource(httpClient: PokemonDetailFactory.createHTTPClient())
    }

}
