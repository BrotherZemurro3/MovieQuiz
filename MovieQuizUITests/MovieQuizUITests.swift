//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Дионисий Коневиченко on 08.12.2024.
//

import XCTest

final class MovieQuizUITests: XCTestCase {

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
    
    func testScreenCast() throws {}

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
