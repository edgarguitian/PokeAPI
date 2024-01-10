//
//  PokeAPILocationAreaUITests.swift
//  PokeAPIUITests
//
//  Created by Edgar Guitian Rey on 10/1/24.
//

import XCTest

final class PokeAPILocationAreaUITests: XCTestCase {
    private var app: XCUIApplication!
    private let identifierPokemonListGrid = "pokemonListGrid"
    private let identifierPokemonListLink = "pokemonListLink"
    private let identifierPokemonDetailView = "pokemonDetailView"
    
    private let identifierCollapsePokemonDetailLocation = "collapsePokemonDetailLocations"
    private let identifierPokemonDetailLocation = "pokemonDetailLocation"

    private let identifierLocationAreaView = "locationAreaView"
    private let identifierLocationAreaName = "locationAreaName"
    private let identifierLocationAreaLocationName = "locationAreaLocationName"
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown()  {
        app = nil
    }
    
    func test_press_on_first_pokemon_press_first_location_check_location_area_info() throws {
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
        
        XCTAssertTrue(app.staticTexts[identifierLocationAreaName].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts[identifierLocationAreaLocationName].waitForExistence(timeout: 5))


    }
}

