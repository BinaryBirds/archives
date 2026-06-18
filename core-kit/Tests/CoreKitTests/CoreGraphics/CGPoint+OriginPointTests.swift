//
//  CGPoint+OriginPointTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_OriginPointTests: XCTestCase {

    func testSquare() throws {
        let p = CGPoint(x: 5, y: 5)
        let s = CGSize(width: 10, height: 10)
        
        let o = p.originPoint(for: s)
        XCTAssertEqual(o, CGPoint(x: 0, y: 0))
    }
    
    func testRect() throws {
        let p = CGPoint(x: 5, y: 5)
        let s = CGSize(width: 20, height: 10)
        
        let o = p.originPoint(for: s)
        XCTAssertEqual(o, CGPoint(x: -5, y: 0))
    }
    
    func testZero() throws {
        let p = CGPoint.zero
        let s = CGSize(width: 20, height: 10)
        
        let o = p.originPoint(for: s)
        XCTAssertEqual(o, CGPoint(x: -10, y: -5))
    }
}


