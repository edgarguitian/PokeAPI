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

    init(apiDataSource: APIPokemonListDataSourceType,
         errorMapper: PokemonDomainErrorMapper,
         domainMapper: PokemonListDomainMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }

    func getPokemonList() async -> Result<PokemonListInfoResponse, PokemonDomainError> {
        let pokemonResponse = await apiDataSource.getPokemonList()

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
        return .success(PokemonListInfoResponse(results: pokemonListDomain))
    }

}
