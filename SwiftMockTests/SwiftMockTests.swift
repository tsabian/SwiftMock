//
//  SwiftMockTests.swift
//  SwiftMockTests
//
//  Created by Tiago Oliveira on 24/09/21.
//

import XCTest
@testable import SwiftMock

class SwiftMockTests: XCTestCase {

    var mock: SwiftMock<Operations>!
    var sut: Operations!

    override func setUp() {
        super.setUp()
        sut = Operations()
        mock = SwiftMock()
    }

    override func tearDown() {
        mock = nil
        sut = nil
        super.tearDown()
    }

    func testSumOperation() {
        let expected: Int = 30
        mock.setup(call: { $0.sum(valueA: 10, valueB: 10) }, thenReturn: expected)
        let result = sut.sum(valueA: 10, valueB: 10)
        XCTAssertEqual(expected, result)
    }
/*
    func testDivideOperation() {
        let expected = 5.0
        mock.setup(call: #selector(sut.divide(valueA:valueB:)), thenReturn: expected)
        do {
            let result = try sut.divide(valueA: 10, valueB: 2)
            XCTAssertEqual(expected, result)
        } catch {
            XCTFail("divide should not be fail")
        }
    }

    func testDivideZeroOperation() {
        let expected = OperationError.divideByZero
        mock.setup(call: #selector(sut.divide(valueA:valueB:)), throw: expected)
        do {
            _ = try sut.divide(valueA: 10, valueB: 0)
            XCTFail("divide should be fail")
        } catch OperationError.divideByZero {
            XCTAssertTrue(true)
        } catch {
            XCTFail("divide should not be fail")
        }
    }*/
}

enum OperationError: Error {
    case divideByZero
}

class Operations {
    @objc func sum(valueA: Int, valueB: Int) -> Int {
        return valueA + valueB
    }

    func divide(valueA: Float, valueB: Float) throws -> Float {
        if valueB == 0 {
            throw OperationError.divideByZero
        }
        return valueA / valueB
    }
}
