//
//  PokemonAPIUIErrorTests.swift
//  PokeAPIUITests
//
//  Created by Edgar Guitian Rey on 10/1/24.
//

import XCTest

final class PokemonAPIUIErrorTests: XCTestCase {
    private var app: XCUIApplication!
    private let identifierPokemonListGrid = "pokemonListGrid"
    private let identifierPokemonListErrorMessage = "pokemonListErrorMessage"

    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments += ["UITestErrorHandling"]
        app.launch()
    }

    override func tearDown()  {
        app = nil
    }

    func test_error_handling() throws {

        // Asegúrate de que la vista está presente
        XCTAssertFalse(app.otherElements[identifierPokemonListGrid].waitForExistence(timeout: 5))
        
        
        // Espera un tiempo razonable para que se maneje el error (ajusta según sea necesario)
        sleep(3)
        
        print(app.debugDescription)
        // Verifica que se muestra el mensaje de error
        XCTAssertTrue(app.staticTexts[identifierPokemonListErrorMessage].exists)
    }
}
