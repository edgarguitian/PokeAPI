//
//  APISingleLocationDataSource.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class APISingleLocationDataSource: APISingleLocationDataSourceType {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getLocationInfo(url: String) async -> Result<LocationListInfoDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: "",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: url)

        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let locationResponse = try? JSONDecoder().decode(LocationListInfoDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(locationResponse)
    }

    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }

        return error
    }
}
