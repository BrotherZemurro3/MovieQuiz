//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Дионисий Коневиченко on 08.12.2024.
//

import XCTest
import UIKit
import Foundation
@testable import MovieQuiz
 class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        // это специальная настройка для тестов: если один тест не прошёл
        // то следующие тесты запускаться не будут; и правда, зачем ждать?
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
        try super.setUpWithError()
        app.terminate()
        app = nil
    }
    
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
        
        func testAlert() {
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
        
        func testAlertDismiss() {
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
        @MainActor
        func testExample() throws {
            
            let app = XCUIApplication()
            app.launch()
            
        }
        
        @MainActor
        func testLaunchPerformance() throws {
            if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
                
                measure(metrics: [XCTApplicationLaunchMetric()]) {
                    XCUIApplication().launch()
                }
            }
        }
    }

