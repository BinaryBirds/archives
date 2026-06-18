//
//  Array+ElementTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class Array_ElementTests: XCTestCase {
    
    func testElements() throws {
        let a1 = [1, 2, 3]

        XCTAssertEqual(a1.element(at: -1), nil)
        XCTAssertEqual(a1.element(at: 0), 1)
        XCTAssertEqual(a1.element(at: 1), 2)
        XCTAssertEqual(a1.element(at: 2), 3)
        XCTAssertEqual(a1.element(at: 3), nil)
    }
}
