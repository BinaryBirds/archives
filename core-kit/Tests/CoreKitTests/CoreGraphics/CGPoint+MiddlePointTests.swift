//
//  CGPoint+MiddlePointTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_MiddlePointTests: XCTestCase {

    func testPositive() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 6, y: 9)
        
        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 5, y: 5.5))
    }
    
    func testEqual() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 4, y: 2)
        
        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 4, y: 2))
    }
    
    func testZero() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint.zero
        
        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 2, y: 1))
    }
    
    func testAllZero() throws {
        let p1 = CGPoint.zero
        let p2 = CGPoint.zero
        
        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, .zero)
    }
    
    func testNegative() throws {
        let p1 = CGPoint(x: -4, y: 2)
        let p2 = CGPoint(x: 6, y: -9)
        
        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 1, y: -3.5))
    }
    
    func testDouble() throws {
        let p1 = CGPoint(x: -4, y: 3.33)
        let p2 = CGPoint(x: 3.14, y: 9)

        let m = p1.middlePoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: -0.42999999999999994, y: 6.165))
    }
}
