//
//  PokeAPIListPokemonsUITests.swift
//  PokeAPIListPokemonsUITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
final class PokeAPIListPokemonsUITests: XCTestCase {
    private var app: XCUIApplication!
    private let scrollPokemonsIdentifier = "scrollPokemons"
    private let identifierPokemonListGrid = "pokemonListGrid"
    private let identifierPokemonListCard = "pokemonCard_"
    private let identifierPokemonNavigationBar = "Pokemons"
    private let identifierPokemonSearchField = "Search"
    private let identifierPokemonListLink = "pokemonListLink"
    private let identifierLoadingIndicator = "LoadingIndicator"
    private let identifierPokemonDetailView = "pokemonDetailView"

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_initial_loading() throws {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))

        app.launchArguments += ["UITestInitialLoading"]

        sleep(3)

        XCTAssertFalse(app.progressIndicators[identifierLoadingIndicator].exists)
        XCTAssertTrue(app.buttons.matching(identifier: identifierPokemonListLink).count > 0)
    }

    func test_image_presentation() throws {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))

        app.launchArguments += ["UITestImagePresentation"]

        sleep(3)

        let pokemonCardButtons = app.buttons.matching(identifier: identifierPokemonListLink)
        XCTAssertTrue(pokemonCardButtons.count > 0)

        for pokemonCardId in 0..<min(pokemonCardButtons.count, 3) {
            let pokemonCardButton = pokemonCardButtons.element(boundBy: pokemonCardId)
            XCTAssertTrue(pokemonCardButton.images["\(identifierPokemonListCard)\(pokemonCardId + 1)"].exists)
        }
    }

    func test_count_num_pokemons_on_list() {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 20))
        let scrollPokemons = app.scrollViews[scrollPokemonsIdentifier]
        XCTAssert(scrollPokemons.exists)
        let maxScrolls = 3
        var count = 0
        while count < maxScrolls {
            app.swipeUp()
            count += 1
        }
        let pokemonCards = app.buttons.matching(identifier: identifierPokemonListLink)

        XCTAssertEqual(pokemonCards.count, 20)

    }

    func test_search() {
        let searchField = app.navigationBars[identifierPokemonNavigationBar].searchFields[identifierPokemonSearchField]
        XCTAssertTrue(searchField.exists)

        searchField.tap()
        searchField.typeText("Char")
        let pokemonBulbasaur = app.staticTexts["Bulbasaur"]
        XCTAssertFalse(pokemonBulbasaur.exists)
        let pokemonCharmander = app.staticTexts["Charmander"]
        XCTAssert(pokemonCharmander.exists)
        let pokemonCharmeleon = app.staticTexts["Charmeleon"]
        XCTAssert(pokemonCharmeleon.exists)
        let pokemonCharizard = app.staticTexts["Charizard"]
        XCTAssert(pokemonCharizard.exists)

    }

    func test_press_on_first_pokemon_and_back() throws {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))

        app.buttons.matching(identifier: identifierPokemonListLink).element(boundBy: 0).tap()
        XCTAssertTrue(app.collectionViews[identifierPokemonDetailView].waitForExistence(timeout: 5))
        app.navigationBars.buttons.element(boundBy: 0).tap()

        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))

    }
}

extension XCUIElement {
    var isAtBottom: Bool {
        // Comprueba si el contenido del ScrollView está en la parte inferior
        guard self.exists else { return false }
        return self.frame.contains(self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9)).screenPoint)
    }
}
