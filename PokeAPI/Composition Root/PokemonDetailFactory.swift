//
//  PokemonDetailFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class PokemonDetailFactory: CreatePokemonDetailView {
    func create(pokemonId: String) -> PokemonDetailView {
        return PokemonDetailView(viewModel: createViewModel(pokemonId: pokemonId))
    }
    
    func createViewModel(pokemonId: String) -> PokemonDetailViewModel {
        return PokemonDetailViewModel(pokemonId: pokemonId, getSinglePokemon: createUseCase(), errorMapper: PokemonPresentableErrorMapper())
    }
    
    private func createUseCase() -> GetSinglePokemonType {
        return GetSinglePokemon(repository: createRepository())
    }
    
    private func createRepository() -> SinglePokemonRepositoryType {
        return SinglePokemonRepository(apiDataSource: createAPIDataSource(),
                                       errorMapper: PokemonDomainErrorMapper(),
                                       domainMapper: SinglePokemonDomainMapper())
    }
    
    private func createAPIDataSource() -> APISinglePokemonDataSourceType {
        return APISinglePokemonDataSource(httpClient: PokemonDetailFactory.createHTTPClient())
    }
    
    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
    
    
}
