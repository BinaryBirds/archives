//
//  CGSize+OperationsTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGSize_OperationsTests: XCTestCase {

    func testOperations() throws {
        let s1 = CGSize(width: 5, height: 3)
        let f1 = CGFloat(2)

        XCTAssertEqual(s1 + f1, CGSize(width: 7, height: 5))
        XCTAssertEqual(s1 - f1, CGSize(width: 3, height: 1))
        XCTAssertEqual(s1 * f1, CGSize(width: 10, height: 6))
        XCTAssertEqual(s1 / f1, CGSize(width: 2.5, height: 1.5))
        XCTAssertEqual(-s1, CGSize(width: -5, height: -3))
        
        var p3 = s1
        p3 += f1
        XCTAssertEqual(p3, CGSize(width: 7, height: 5))
        p3 -= f1
        p3 -= f1
        XCTAssertEqual(p3, CGSize(width: 3, height: 1))
        p3 += f1
        p3 *= f1
        XCTAssertEqual(p3, CGSize(width: 10, height: 6))
        p3 /= f1
        p3 /= f1
        XCTAssertEqual(p3, CGSize(width: 2.5, height: 1.5))
        p3 *= f1
        XCTAssertEqual(p3, CGSize(width: 5, height: 3))
    }
    
}
