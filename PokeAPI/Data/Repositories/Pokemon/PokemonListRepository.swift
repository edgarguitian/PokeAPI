//
//  PokemonListRepository.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonListRepository: PokemonListRepositoryType {

    private let apiDataSource: APIPokemonListDataSourceType
    private let errorMapper: PokemonDomainErrorMapper
    private let domainMapper: PokemonListDomainMapper
    private let cacheDataSource: CachePokemonListDataSourceType

    init(apiDataSource: APIPokemonListDataSourceType,
         errorMapper: PokemonDomainErrorMapper,
         domainMapper: PokemonListDomainMapper,
         cacheDataSource: CachePokemonListDataSourceType) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
        self.cacheDataSource = cacheDataSource
    }

    func getPokemonList(page: Int) async -> Result<PokemonListInfoResponse, PokemonDomainError> {
        let pokemonsListCache = await cacheDataSource.getPokemonsList(page: page)

        if pokemonsListCache.page == page && pokemonsListCache.count > 0 {
            return .success(pokemonsListCache)
        }

        let pokemonResponse = await apiDataSource.getPokemonList(page: page)

        guard case .success(let pokemonListInfo) = pokemonResponse else {
            return .failure(errorMapper.map(error: pokemonResponse.failureValue as? HTTPClientError))
        }

        var pokemonListDomain: [PokemonListInfo] = []

            for pokemonEntry in pokemonListInfo.results {
                let pokemonInfoResponse = await apiDataSource.getPokemonListInfo(url: pokemonEntry.url)

                guard case .success(let pokemonInfo) = pokemonInfoResponse else {
                    return .failure(errorMapper.map(error: pokemonInfoResponse.failureValue as? HTTPClientError))
                }

                let pokemonDomain = domainMapper.map(infoDTO: pokemonInfo)
                pokemonListDomain.append(pokemonDomain)
            }

        let pokemonListInfoResponse = PokemonListInfoResponse(results: pokemonListDomain,
                                                              count: pokemonListInfo.count,
                                                              page: page)

        await cacheDataSource.savePokemonsList(pokemonListInfoResponse, page: page)

        return .success(pokemonListInfoResponse)
    }

}
