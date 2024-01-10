//
//  PokeAPIListPokemonsUITests.swift
//  PokeAPIListPokemonsUITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
final class PokeAPIListPokemonsUITests: XCTestCase {
    private var app: XCUIApplication!
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
    
    override func tearDown()  {
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
        
        for i in 0..<min(pokemonCardButtons.count, 3) {
            let pokemonCardButton = pokemonCardButtons.element(boundBy: i)
            XCTAssertTrue(pokemonCardButton.images["\(identifierPokemonListCard)\(i + 1)"].exists)
        }
    }
    
    func test_count_num_pokemons_on_list() {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].exists)
        
        let pokemonCards = app.buttons.matching(identifier: identifierPokemonListLink)
        
        XCTAssertEqual(pokemonCards.count, 6)
        
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
