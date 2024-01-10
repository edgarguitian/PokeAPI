//
//  PokemonDetailView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject private var viewModel: PokemonDetailViewModel
    private let createLocationAreaView: CreateLocationAreaView

    @State var isInfoSectionExpanded: Bool = false
    @State var isInfoLocationsExpanded: Bool = false
    @State var isAbilitiesSectionExpanded: Bool = false
    @State var isFormsSectionExpanded: Bool = false
    @State var isGameIndicesSectionExpanded: Bool = false
    @State var isHeldItemsSectionExpanded: Bool = false
    @State var isMovesSectionExpanded: Bool = false
    @State var isStatsSectionExpanded: Bool = false
    @State var isTypesSectionExpanded: Bool = false
    @State var isPastTypesSectionExpanded: Bool = false

    init(viewModel: PokemonDetailViewModel, createLocationAreaView: CreateLocationAreaView) {
        self.viewModel = viewModel
        self.createLocationAreaView = createLocationAreaView
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
                        .accessibilityIdentifier("pokemonDetailImage")

                        disclosureGroup(label: "Info", isExpanded: $isInfoSectionExpanded) {
                            PokemonDetailInfoView(viewModel: viewModel)
                        }

                        if !viewModel.locationDetailInfo.values.isEmpty {

                            disclosureGroup(label: "Locations", isExpanded: $isInfoLocationsExpanded) {
                                PokemonDetailLocationsView(viewModel: viewModel,
                                                           createLocationAreaView: createLocationAreaView)
                            }

                        }

                        disclosureGroup(label: "Abilities", isExpanded: $isAbilitiesSectionExpanded) {
                            PokemonDetailAbilitiesView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Forms", isExpanded: $isFormsSectionExpanded) {
                            PokemonDetailFormsView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Game Indices", isExpanded: $isGameIndicesSectionExpanded) {
                            PokemonDetailGameIndicesView(viewModel: viewModel)
                        }

                        if !viewModel.pokemonDetailInfo.heldItems.isEmpty {

                            disclosureGroup(label: "Held Items", isExpanded: $isHeldItemsSectionExpanded) {
                                PokemonDetailHeldItemsView(viewModel: viewModel)
                            }
                        }

                        disclosureGroup(label: "Moves", isExpanded: $isMovesSectionExpanded) {
                            PokemonDetailMovesView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Stats", isExpanded: $isStatsSectionExpanded) {
                            PokemonDetailStatsView(viewModel: viewModel)
                        }

                        disclosureGroup(label: "Types", isExpanded: $isTypesSectionExpanded) {
                            PokemonDetailTypesView(viewModel: viewModel)
                        }

                        if !viewModel.pokemonDetailInfo.pastTypes.isEmpty {

                            disclosureGroup(label: "Past Types", isExpanded: $isPastTypesSectionExpanded) {
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
        .accessibilityIdentifier("pokemonDetailView")
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
            .accessibilityIdentifier("collapsePokemonDetail\(label.replacingOccurrences(of: " ", with: ""))")
            .foregroundColor(.primary)
        }
    }

}

#Preview {
    PokemonDetailFactory().create(pokemonId: "6")
}

struct PokemonDetailInfoView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel

    var body: some View {
        PokemonDetailItemView(title: "Base Experience",
                              value: viewModel.pokemonDetailInfo.baseExperience)
        .accessibilityIdentifier("pokemonDetailBaseExperience")
        PokemonDetailItemView(title: "Height",
                              value: viewModel.pokemonDetailInfo.height)
        .accessibilityIdentifier("pokemonDetailHeight")
        PokemonDetailItemView(title: "Weight",
                              value: viewModel.pokemonDetailInfo.weight)
        .accessibilityIdentifier("pokemonDetailWeight")

    }
}

struct PokemonDetailLocationsView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel
    let createLocationAreaView: CreateLocationAreaView

    var body: some View {
        ForEach(viewModel.locationDetailInfo.values, id: \.self) { value in
            NavigationLink {
                createLocationAreaView.create(url: value.url)
            } label: {
                VStack(alignment: .leading) {
                    Text(value.name)
                        .font(.callout)
                        .accessibilityIdentifier("pokemonDetailLocation")
                }
            }

        }

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
                        .font(.callout)
                        .accessibilityIdentifier("pokemonDetailAbility")
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
                        .font(.callout)
                        .accessibilityIdentifier("pokemonDetailForm")

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
                PokemonDetailItemView(title: gameindice.version.name.capitalizeFirstLetter(),
                                      value: gameindice.gameIndex)
                .accessibilityIdentifier("pokemonDetailGameIndice")
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
                                .font(.callout)
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
                        .font(.callout)
                        .accessibilityIdentifier("pokemonDetailMove")

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
                PokemonDetailItemView(title: stat.stat.name.uppercased(),
                                      value: stat.baseStat)
                .accessibilityIdentifier("pokemonDetailStat")

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
                    Text(type.type.name.capitalizeFirstLetter())
                        .font(.callout)
                        .accessibilityIdentifier("pokemonDetailType")

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
                    Text(pasttype.generation.name.capitalizeFirstLetter())
                        .font(.callout)
                }
            }

        }

    }
}
