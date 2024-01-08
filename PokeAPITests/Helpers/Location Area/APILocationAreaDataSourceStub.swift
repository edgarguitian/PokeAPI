//
//  APILocationAreaDataSourceStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class APILocationAreaDataSourceStub: APILocationAreaDataSourceType {

    private let locationList: Result<PokeAPI.LocationAreaDTO, PokeAPI.HTTPClientError>

    init(locationList: Result<PokeAPI.LocationAreaDTO, PokeAPI.HTTPClientError>) {
        self.locationList = locationList
    }
    
    func getLocationInfo(url: String) async -> Result<PokeAPI.LocationAreaDTO, PokeAPI.HTTPClientError> {
        return locationList
    }
    
    
}
