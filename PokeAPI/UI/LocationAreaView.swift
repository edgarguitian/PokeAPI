//
//  LocationAreaView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import SwiftUI

struct LocationAreaView: View {
    @ObservedObject private var viewModel: LocationAreaViewModel

    init(viewModel: LocationAreaViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                ProgressView()
            } else {
                if viewModel.showErrorMessage == nil {
                    List {
                        PokemonDetailItemView(title: "Name",
                                              value: viewModel.locationAreaInfo.name)
                            .accessibilityIdentifier("locationAreaName")

                        PokemonDetailItemView(title: "Location",
                                              value: viewModel.locationAreaInfo.location.name)
                            .accessibilityIdentifier("locationAreaLocationName")
                    }
                } else {
                    Text(viewModel.showErrorMessage!)
                }
            }
        }
        .accessibilityIdentifier("locationAreaView")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    LocationAreaFactory().create(url: "https://pokeapi.co/api/v2/location-area/1/")
}
