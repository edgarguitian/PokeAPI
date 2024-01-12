//
//  SwiftDataCachePokemonListDataSource.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation

class SwiftDataCachePokemonListDataSource: CachePokemonListDataSourceType {

    private let container: SwiftDataPokemonListContainerType
    private let mapper: SwiftDataPokemonListDomainMapper

    init(container: SwiftDataPokemonListContainerType, mapper: SwiftDataPokemonListDomainMapper) {
        self.container = container
        self.mapper = mapper
    }

    func getPokemonsList(page: Int) async -> PokemonListInfoResponse {
        let pokemonsList = container.fetchPokemons(page: page)
        return mapper.map(pokemonsList, page: page)
    }

    func savePokemonsList(_ pokemonsList: PokemonListInfoResponse, page: Int) async {
        for pokemon in pokemonsList.results {
            let pokemonData = PokemonListData(id: pokemon.id,
                                              name: pokemon.name,
                                              image: pokemon.image,
                                              page: page,
                                              count: pokemonsList.count)
            await container.insert(pokemonsDataList: pokemonData)
        }

        await container.saveData()

    }

}
