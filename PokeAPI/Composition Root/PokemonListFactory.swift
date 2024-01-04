//
//  PokemonListFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonListFactory {
    static func create() -> PokemonListView {
        return PokemonListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> PokemonListViewModel {
        return PokemonListViewModel(getPokemonList: createPokemonListUseCase(), errorMapper: PokemonPresentableErrorMapper())
    }
    
    private static func createPokemonListUseCase() -> GetPokemonListType {
        return GetPokemonList(repository: createPokemonListRepository())
    }
    
    private static func createPokemonListRepository() -> PokemonListRepositoryType {
        return PokemonListRepository(apiDataSource: createApiPokemonListDataSource(),
                                     errorMapper: PokemonDomainErrorMapper())
    }
    
    private static func createApiPokemonListDataSource() -> APIPokemonListDataSourceType {
        return APIPokemonListDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
