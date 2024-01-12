//
//  PokemonListFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonListFactory {
    static func create() -> PokemonListView {
        return PokemonListView(viewModel: createViewModel(),
                               createPokemonDetailView: PokemonDetailFactory())
    }

    private static func createViewModel() -> PokemonListViewModel {
        return PokemonListViewModel(getPokemonList: createPokemonListUseCase(),
                                    errorMapper: PokemonPresentableErrorMapper())
    }

    private static func createPokemonListUseCase() -> GetPokemonListType {
        return GetPokemonList(repository: createPokemonListRepository())
    }

    private static func createPokemonListRepository() -> PokemonListRepositoryType {
        return PokemonListRepository(apiDataSource: createApiPokemonListDataSource(),
                                     errorMapper: PokemonDomainErrorMapper(),
                                     domainMapper: PokemonListDomainMapper(),
                                     cacheDataSource: createCacheDataSource())
    }

    private static func createCacheDataSource() -> CachePokemonListDataSourceType {
        return SwiftDataCachePokemonListDataSource(container: SwiftDataPokemonListContainer.shared,
                                                   mapper: SwiftDataPokemonListDomainMapper())
    }

    private static func createApiPokemonListDataSource() -> APIPokemonListDataSourceType {
        return APIPokemonListDataSource(httpClient: createHTTPClient())
    }

    private static func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
