//
//  CGPoint+OperationsTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_OperationsTests: XCTestCase {

    func testOperations() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 6, y: 9)
                
        XCTAssertEqual(p1 + p2, CGPoint(x: 10, y: 11))
        XCTAssertEqual(p1 - p2, CGPoint(x: -2, y: -7))
        XCTAssertEqual(p1 * p2, CGPoint(x: 24, y: 18))
        XCTAssertEqual(p1 / p2, CGPoint(x: 0.6666666666666666, y: 0.2222222222222222))
        XCTAssertEqual(-p1, CGPoint(x: -4, y: -2))
        
        var p3 = p1
        p3 += p2
        XCTAssertEqual(p3, CGPoint(x: 10, y: 11))
        p3 -= p2
        p3 -= p2
        XCTAssertEqual(p3, CGPoint(x: -2, y: -7))
        p3 += p2
        p3 *= p2
        XCTAssertEqual(p3, CGPoint(x: 24, y: 18))
        p3 /= p2
        p3 /= p2
        XCTAssertEqual(p3, CGPoint(x: 0.6666666666666666, y: 0.2222222222222222))
        p3 *= p2
        XCTAssertEqual(p3, CGPoint(x: 4, y: 2))
    }
    
}
