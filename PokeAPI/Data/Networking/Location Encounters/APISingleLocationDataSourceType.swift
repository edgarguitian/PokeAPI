//
//  APISingleLocationDataSourceType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol APISingleLocationDataSourceType {
    func getLocationInfo(url: String) async -> Result<LocationListInfoDTO, HTTPClientError>
}
