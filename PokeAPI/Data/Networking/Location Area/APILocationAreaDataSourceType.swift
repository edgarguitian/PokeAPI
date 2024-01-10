//
//  APILocationAreaDataSourceType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

protocol APILocationAreaDataSourceType {
    func getLocationInfo(url: String) async -> Result<LocationAreaDTO, HTTPClientError>
}
