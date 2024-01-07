//
//  SingleLocationInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

struct SingleLocationInfo {
    let name: [String]
    let url: [String]
    
    init(name: [String], url: [String]) {
        self.name = name
        self.url = url
    }
    
    init() {
        self.name = []
        self.url = []
    }
    
    init(response: LocationListInfoDTO) {
        if response.count > 0 {
            var names: [String] = []
            var urls: [String] = []
            for element in response {
                names.append(element.locationArea.name)
                urls.append(element.locationArea.url)
            }
            self.name = names
            self.url = urls
        } else {
            self.name = []
            self.url = []
        }
        
    }
}
