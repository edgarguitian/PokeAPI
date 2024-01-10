//
//  APILocationAreaDataSource.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class APILocationAreaDataSource: APILocationAreaDataSourceType {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getLocationInfo(url: String) async -> Result<LocationAreaDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: "",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: url)

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        if let jsonString = String(data: data, encoding: .utf8) {
                    print("Valor de data: \(jsonString)")
                } else {
                    print("No se pudo convertir data a cadena")
                }

        guard let locationAreaResponse = try? JSONDecoder().decode(LocationAreaDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(locationAreaResponse)
    }

    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }

        return error
    }
}
