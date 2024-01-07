//
//  APIPokemonListDataSource.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class APIPokemonListDataSource: APIPokemonListDataSourceType {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getPokemonList() async -> Result<PokemonListResponseDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [
            "limit": 6
        ]

        let endpoint = Endpoint(path: "pokemon",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://pokeapi.co/api/v2/")

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let pokemonListResponse = try? JSONDecoder().decode(PokemonListResponseDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(pokemonListResponse)
    }
    
    func getPokemonListInfo(url: String) async -> Result<PokemonListInfoDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: "",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: url)

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        guard let pokemonListInfoResponse = try? JSONDecoder().decode(PokemonListInfoDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(pokemonListInfoResponse)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }

        return error
    }
}
