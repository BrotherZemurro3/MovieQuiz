//
//  ArrayTests.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 07.12.2024.
//

import UIKit
import Foundation
import XCTest
@testable import MovieQuiz // импорт приложения для теста

class ArrayTests: XCTestCase {
    func testGetValueInRange() throws { // тест на успешное взятие элемента по индексу
        
        // Given
        let array = [1, 1, 2, 3, 5]
        // When
        
        let value = array[safe: 2]
        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value,2)
        
    }
    func testGetValueOutOfRange() throws { // тест на взятие элемента по неравильному индеку
        // Given
        let array = [1,1,2,3,5]
        // When
        let value = array[safe: 20]
        
        // Then
        XCTAssertNil(value)
    }
}
