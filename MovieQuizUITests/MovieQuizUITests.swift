//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Дионисий Коневиченко on 08.12.2024.
//

import XCTest
@testable import MovieQuiz
final class MovieQuizUITests: XCTestCase {
    var app: XCUIApplication!

       override func setUpWithError() throws {
           try super.setUpWithError()

           app = XCUIApplication()
           app.launch()

           continueAfterFailure = false
       }

       override func tearDownWithError() throws {
           try super.tearDownWithError()

           app.terminate()
           app = nil
       }
    func testScreenCast() throws {}
    
    func testYesButton() {
        sleep(3)
        let firstPoster = app.images["Poster"] // находим первоначальный постер
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap() // находим кнопку Да и нажимем её
        sleep(3)
        
        let secondPoster = app.images["Poster"] // еще раз находим постер
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertNotEqual(firstPosterData, secondPosterData) // проверяем, что постеры разные
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertEqual(indexLabel.label, "2/10")
    }
    func testNoButton() {
        sleep(3)
        let firstPoster = app.images["Poster"] // находим первоначальный постер
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        sleep(3)
        let secondPoster = app.images["Poster"] // еще раз находим постер
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertNotEqual(firstPosterData, secondPosterData) // проверяем, что постеры разные
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertEqual(indexLabel.label, "2/10")
        
        func AlertTest() throws {
                    sleep(3)
                    for _ in 1...10 {
                        app.buttons["No"].tap()
                        sleep(3)
                    }
                    let alert = app.alerts["Game results"]
                    XCTAssertTrue(alert.exists)
                    XCTAssertTrue(alert.label == "Этот раунд окончен")
                    XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть еще раз")
                }
        
        func AlertDismissTest() throws {
                    sleep(3)
                    for _ in 1...10 {
                        app.buttons["No"].tap()
                        sleep(3)
                    }
                    let alert = app.alerts["Game results"]
                    alert.buttons.firstMatch.tap()
                    sleep(3)
                    let indexLabel = app.staticTexts["Index"]
                    XCTAssertFalse(alert.exists)
                    XCTAssertTrue(indexLabel.label == "1/10")
                }
    }
}
    


