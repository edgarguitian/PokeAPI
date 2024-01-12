//
//  APISingleLocationDataSourceStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class APISingleLocationDataSourceStub: APISingleLocationDataSourceType {
    private let locationList: Result<PokeAPI.LocationListInfoDTO, PokeAPI.HTTPClientError>

    init(locationList: Result<PokeAPI.LocationListInfoDTO, PokeAPI.HTTPClientError>) {
        self.locationList = locationList
    }

    func getLocationInfo(url: String) async -> Result<PokeAPI.LocationListInfoDTO, PokeAPI.HTTPClientError> {
        return locationList
    }

}
