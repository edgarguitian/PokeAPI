//
//  PokemonDetailView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject private var viewModel: PokemonDetailViewModel

    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                ProgressView()
            } else {
                if viewModel.showErrorMessage == nil {
                    List {
                        AsyncImage(url: URL(string: viewModel.pokemonDetailInfo.sprites.frontDefault)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        DisclosureGroup("Info", isExpanded: $viewModel.isInfoSectionExpanded) {
                                                    PokemonDetailInfoView(viewModel: viewModel)
                                                }
                        
                        DisclosureGroup("Abilities", isExpanded: $viewModel.isAbilitiesSectionExpanded) {
                                                    PokemonDetailAbilitiesView(viewModel: viewModel)
                                                }
                        
                        DisclosureGroup("Forms", isExpanded: $viewModel.isFormsSectionExpanded) {
                                                    PokemonDetailFormsView(viewModel: viewModel)
                                                }
                        
                        DisclosureGroup("Game Indices", isExpanded: $viewModel.isGameIndicesSectionExpanded) {
                            PokemonDetailGameIndicesView(viewModel: viewModel)
                        }

                        if !viewModel.pokemonDetailInfo.heldItems.isEmpty {
                            DisclosureGroup("Held Items", isExpanded: $viewModel.isHeldItemsSectionExpanded) {
                                PokemonDetailHeldItemsView(viewModel: viewModel)
                            }
                        }

                        DisclosureGroup("Moves", isExpanded: $viewModel.isMovesSectionExpanded) {
                            PokemonDetailMovesView(viewModel: viewModel)
                        }

                        DisclosureGroup("Stats", isExpanded: $viewModel.isStatsSectionExpanded) {
                            PokemonDetailStatsView(viewModel: viewModel)
                        }

                        DisclosureGroup("Types", isExpanded: $viewModel.isTypesSectionExpanded) {
                            PokemonDetailTypesView(viewModel: viewModel)
                        }

                        if !viewModel.pokemonDetailInfo.pastTypes.isEmpty {
                            DisclosureGroup("Past Types", isExpanded: $viewModel.isPastTypesSectionExpanded) {
                                PokemonDetailPastTypesView(viewModel: viewModel)
                            }
                        }
                    }
                } else {
                    Text(viewModel.showErrorMessage!)
                }
            }
        }
        .navigationTitle("Nº. \(viewModel.pokemonDetailInfo.id) " + viewModel.pokemonDetailInfo.name)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    PokemonDetailFactory().create(pokemonId: "1")
}

struct PokemonDetailInfoView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        PokemonDetailItemView(title: "Base Experience",
                              value: viewModel.pokemonDetailInfo.baseExperience)
        PokemonDetailItemView(title: "Height",
                              value: viewModel.pokemonDetailInfo.height)
        PokemonDetailItemView(title: "Weight",
                              value: viewModel.pokemonDetailInfo.weight)
        
        PokemonDetailItemView(title: "Location",
                              value: viewModel.pokemonDetailInfo.locationAreaEncounters)
        
        PokemonDetailItemView(title: "Specie",
                              value: viewModel.pokemonDetailInfo.species.name)
    }
}

struct PokemonDetailAbilitiesView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.abilities, id: \.self) { ability in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(ability.ability.name)
                        .font(.title3)
                }
            }

        }
    }
}

struct PokemonDetailFormsView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.forms, id: \.self) { form in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(form.name)
                        .font(.title3)
                }
            }

        }
        
    }
}

struct PokemonDetailGameIndicesView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.gameIndices, id: \.self) { gameindice in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(gameindice.gameIndex)
                        .font(.title3)
                    Text(gameindice.version.name)
                        .font(.title3)
                }
            }

        }

    }
}

struct PokemonDetailHeldItemsView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        if !viewModel.pokemonDetailInfo.heldItems.isEmpty {
            Section(header: Text("Held Items")
                .font(.title2)
            ) {
                ForEach(viewModel.pokemonDetailInfo.heldItems, id: \.self) { helditem in
                    NavigationLink {
                        
                    } label: {
                        VStack(alignment: .leading) {
                            Text(helditem.item.name)
                                .font(.title3)
                        }
                    }

                }
                
            }
        }
        
    }
}

struct PokemonDetailMovesView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.moves, id: \.self) { move in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(move.move.name)
                        .font(.title3)
                }
            }

        }
        
    }
}

struct PokemonDetailStatsView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.stats, id: \.self) { stat in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(stat.baseStat)
                        .font(.title3)
                    Text(stat.effort)
                        .font(.title3)
                    Text(stat.stat.name)
                        .font(.title3)
                }
            }

        }
        
    }
}

struct PokemonDetailTypesView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.types, id: \.self) { type in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(type.slot)
                        .font(.title3)
                    Text(type.type.name)
                        .font(.title3)
                }
            }

        }
        
    }
}

struct PokemonDetailPastTypesView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        ForEach(viewModel.pokemonDetailInfo.pastTypes, id: \.self) { pasttype in
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text(pasttype.generation.name)
                        .font(.title3)
                }
            }

        }
        
    }
}
