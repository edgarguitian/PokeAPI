//
//  SingleLocationInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

struct SingleLocationInfo {
    let values: [NameUrl]

    init(values: [NameUrl]) {
        self.values = values
    }

    init() {
        self.values = []
    }

    init(response: LocationListInfoDTO) {
        if response.count > 0 {
            var values: [NameUrl] = []
            for element in response {
                values.append(NameUrl(name: element.locationArea.name, url: element.locationArea.url))
            }
            self.values = values
        } else {
            self.values = []
        }

    }
}
