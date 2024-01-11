//
//  LocationAreaView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import SwiftUI

struct LocationAreaView: View {
    @ObservedObject private var viewModel: LocationAreaViewModel
    @State var isEncounterMethodRatesSectionExpanded: Bool = false
    @State var isNamesSectionExpanded: Bool = false
    @State var isPokemonEncountersSectionExpanded: Bool = false

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

                        disclosureGroup(label: "Encounther Method Rates",
                                        isExpanded: $isEncounterMethodRatesSectionExpanded) {
                            LocationAreaEncounterMethodRatesView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Names",
                                        isExpanded: $isNamesSectionExpanded) {
                            LocationAreaNamesView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Pokemon Encounters",
                                        isExpanded: $isPokemonEncountersSectionExpanded) {
                            LocationAreaPokemonEncountersView(viewModel: viewModel)
                        }
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

    private func disclosureGroup<Content: View>(label: String,
                                                isExpanded: Binding<Bool>,
                                                @ViewBuilder content: @escaping () -> Content) -> some View {
        DisclosureGroup(isExpanded: isExpanded) {
            content()
        } label: {
            Button(action: {
                withAnimation {
                    isExpanded.wrappedValue.toggle()
                }
            }, label: {
                Text(label)
                    .foregroundColor(.primary)
            })
            .accessibilityIdentifier("collapseLocationArea\(label.replacingOccurrences(of: " ", with: ""))")
            .foregroundColor(.primary)
        }
    }
}

#Preview {
    LocationAreaFactory().create(url: "https://pokeapi.co/api/v2/location-area/1/")
}

struct LocationAreaEncounterMethodRatesView: View {
    @ObservedObject var viewModel: LocationAreaViewModel

    var body: some View {
        ForEach(viewModel.locationAreaInfo.encounterMethodRates, id: \.self) { encounterMethodRate in
            NavigationLink {

            } label: {
                VStack(alignment: .leading) {
                    Text(encounterMethodRate.encounterMethod.name)
                        .font(.callout)
                        .accessibilityIdentifier("locationAreaEncounterMethod")
                }
            }

        }
    }
}

struct LocationAreaNamesView: View {
    @ObservedObject var viewModel: LocationAreaViewModel

    var body: some View {
        ForEach(viewModel.locationAreaInfo.names, id: \.self) { name in
            NavigationLink {

            } label: {
                VStack(alignment: .leading) {
                    Text(name.name)
                        .font(.callout)
                        .accessibilityIdentifier("locationAreaName")
                }
            }

        }
    }
}

struct LocationAreaPokemonEncountersView: View {
    @ObservedObject var viewModel: LocationAreaViewModel

    var body: some View {
        ForEach(viewModel.locationAreaInfo.pokemonEncounters, id: \.self) { pokemonEncounter in
            NavigationLink {

            } label: {
                VStack(alignment: .leading) {
                    Text(pokemonEncounter.pokemon.name)
                        .font(.callout)
                        .accessibilityIdentifier("locationAreaPokemonEncounter")
                }
            }

        }
    }
}
