//
//  CGPoint+DistanceTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_DistanceTests: XCTestCase {
    
    func testOneX() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 5, y: 2)
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 1)
    }
    
    func testOneY() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 4, y: 1)
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 1)
    }
    
    func testPositive() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 6, y: 9)
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 7.280109889280518)
    }
    
    func testEqual() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 4, y: 2)
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 0)
    }
    
    func testZero() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint.zero
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 4.47213595499958)
    }
    
    func testAllZero() throws {
        let p1 = CGPoint.zero
        let p2 = CGPoint.zero
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 0)
    }
    
    func testNegative() throws {
        let p1 = CGPoint(x: -4, y: 2)
        let p2 = CGPoint(x: 6, y: -9)
        
        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 14.866068747318506)
    }
    
    func testDouble() throws {
        let p1 = CGPoint(x: -4, y: 3.33)
        let p2 = CGPoint(x: 3.14, y: 9)

        let d = p1.distance(to: p2)
        XCTAssertEqual(d, 9.117483205358813)
    }
}
