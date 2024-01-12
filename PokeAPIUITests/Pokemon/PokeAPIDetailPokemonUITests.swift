//
//  PokeAPIDetailPokemonUITests.swift
//  PokeAPIUITests
//
//  Created by Edgar Guitian Rey on 10/1/24.
//

import XCTest

final class PokeAPIDetailPokemonUITests: XCTestCase {
    private var app: XCUIApplication!
    private let identifierPokemonListGrid = "pokemonListGrid"
    private let identifierPokemonListLink = "pokemonListLink"
    private let identifierPokemonDetailView = "pokemonDetailView"
    private let identifierPokemonDetailImage = "pokemonDetailImage"

    private let identifierCollapsePokemonDetailInfo = "collapsePokemonDetailInfo"
    private let identifierCollapsePokemonDetailLocation = "collapsePokemonDetailLocations"
    private let identifierCollapsePokemonDetailAbilities = "collapsePokemonDetailAbilities"
    private let identifierCollapsePokemonDetailForms = "collapsePokemonDetailForms"
    private let idCollapsePokemonDetailGameIndices = "collapsePokemonDetailGameIndices"
    private let identifierCollapsePokemonDetailMoves = "collapsePokemonDetailMoves"
    private let identifierCollapsePokemonDetailStats = "collapsePokemonDetailStats"
    private let identifierCollapsePokemonDetailTypes = "collapsePokemonDetailTypes"

    private let identifierPokemonDetailBaseExperience = "pokemonDetailBaseExperience"
    private let identifierPokemonDetailHeight = "pokemonDetailHeight"
    private let identifierPokemonDetailWeight = "pokemonDetailWeight"
    private let identifierPokemonDetailLocation = "pokemonDetailLocation"
    private let identifierPokemonDetailAbility = "pokemonDetailAbility"
    private let identifierPokemonDetailForm = "pokemonDetailForm"
    private let identifierPokemonDetailGameIndice = "pokemonDetailGameIndice"
    private let identifierPokemonDetailMove = "pokemonDetailMove"
    private let identifierPokemonDetailStat = "pokemonDetailStat"
    private let identifierPokemonDetailType = "pokemonDetailType"

    private let identifierLocationAreaView = "locationAreaView"

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_press_on_first_pokemon_and_check_exist_info() throws {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 20))

        app.buttons.matching(identifier: identifierPokemonListLink).element(boundBy: 0).tap()
        XCTAssertTrue(app.collectionViews[identifierPokemonDetailView].waitForExistence(timeout: 5))

        // Check if image exist
        let pokemonDetailImage = app.images[identifierPokemonDetailImage]
        XCTAssert(pokemonDetailImage.exists)

        let navigationTitle = app.navigationBars["Nº. 1 Bulbasaur"]
        XCTAssert(navigationTitle.exists)

        print(app.debugDescription)
        // Check if collapse Info exist
        let collapsePokemonDetailInfo = app.staticTexts[identifierCollapsePokemonDetailInfo]
        XCTAssert(collapsePokemonDetailInfo.exists)

        // Check if collapse Location exist
        let collapsePokemonDetailLocation = app.staticTexts[identifierCollapsePokemonDetailLocation]
        XCTAssert(collapsePokemonDetailLocation.exists)

        // Check if collapse Abilities exist
        let collapsePokemonDetailAbilities = app.staticTexts[identifierCollapsePokemonDetailAbilities]
        XCTAssert(collapsePokemonDetailAbilities.exists)

        // Check if collapse Forms exist
        let collapsePokemonDetailForms = app.staticTexts[identifierCollapsePokemonDetailForms]
        XCTAssert(collapsePokemonDetailForms.exists)

        // Check if collapse Game Indices exist
        let collapsePokemonDetailGameIndices = app.staticTexts[idCollapsePokemonDetailGameIndices]
        XCTAssert(collapsePokemonDetailGameIndices.exists)

        // Check if collapse Moves exist
        let collapsePokemonDetailMoves = app.staticTexts[identifierCollapsePokemonDetailMoves]
        XCTAssert(collapsePokemonDetailMoves.exists)

        // Check if collapse Stats exist
        let collapsePokemonDetailStats = app.staticTexts[identifierCollapsePokemonDetailStats]
        XCTAssert(collapsePokemonDetailStats.exists)

        // Check if collapse Types exist
        let collapsePokemonDetailTypes = app.staticTexts[identifierCollapsePokemonDetailTypes]
        XCTAssert(collapsePokemonDetailTypes.exists)

        // Check items of Info
        collapsePokemonDetailInfo.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailBaseExperience].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailHeight].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailWeight].waitForExistence(timeout: 5))
        collapsePokemonDetailInfo.tap()

        // Check items of Location
        collapsePokemonDetailLocation.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailLocation].waitForExistence(timeout: 5))
        collapsePokemonDetailLocation.tap()

        // Check items of Abilities
        collapsePokemonDetailAbilities.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailAbility].waitForExistence(timeout: 5))
        collapsePokemonDetailAbilities.tap()

        // Check items of Forms
        collapsePokemonDetailForms.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailForm].waitForExistence(timeout: 5))
        collapsePokemonDetailForms.tap()

        // Check items of Game Indices
        collapsePokemonDetailGameIndices.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailGameIndice].waitForExistence(timeout: 5))
        collapsePokemonDetailGameIndices.tap()

        // Check items of Moves
        collapsePokemonDetailMoves.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailMove].waitForExistence(timeout: 5))
        collapsePokemonDetailMoves.tap()

        // Check items of Stats
        collapsePokemonDetailStats.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailStat].waitForExistence(timeout: 5))
        collapsePokemonDetailStats.tap()

        // Check items of Types
        collapsePokemonDetailTypes.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailType].waitForExistence(timeout: 5))
        collapsePokemonDetailTypes.tap()
    }

    func test_press_on_first_pokemon_and_press_on_location() throws {
        XCTAssertTrue(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))

        app.buttons.matching(identifier: identifierPokemonListLink).element(boundBy: 0).tap()
        XCTAssertTrue(app.collectionViews[identifierPokemonDetailView].waitForExistence(timeout: 5))

        // Check if collapse Location exist
        let collapsePokemonDetailLocation = app.staticTexts[identifierCollapsePokemonDetailLocation]
        XCTAssert(collapsePokemonDetailLocation.exists)

        // Check items of Location
        collapsePokemonDetailLocation.tap()
        XCTAssertTrue(app.staticTexts[identifierPokemonDetailLocation].waitForExistence(timeout: 5))

        app.buttons.matching(identifier: identifierPokemonDetailLocation).element(boundBy: 0).tap()

        XCTAssertTrue(app.collectionViews[identifierLocationAreaView].waitForExistence(timeout: 5))
    }
}
