//
//  APISinglePokemonDataSource.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class APISinglePokemonDataSource: APISinglePokemonDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getPokemonInfo(pokemonId: String) async -> Result<PokemonListInfoDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: "pokemon/\(pokemonId)",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://pokeapi.co/api/v2/")

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let pokemonResponse = try? JSONDecoder().decode(PokemonListInfoDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(pokemonResponse)
    }

    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }

        return error
    }
}
