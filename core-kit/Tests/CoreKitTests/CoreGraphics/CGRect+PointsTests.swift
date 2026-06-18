//
//  CGRect+PointsTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGRect_PointsTests: XCTestCase {

    func testPoints() throws {
        let r = CGRect(origin: .init(x: 4, y: 2),
                       size: .init(width: 6, height: 9))
        
        XCTAssertEqual(r.minXminY, .init(x: 4, y: 2))
        XCTAssertEqual(r.minXmidY, .init(x: 4, y: 6.5))
        XCTAssertEqual(r.minXmaxY, .init(x: 4, y: 11))
        XCTAssertEqual(r.midXminY, .init(x: 7, y: 2))
        XCTAssertEqual(r.midXmidY, .init(x: 7, y: 6.5))
        XCTAssertEqual(r.midXmaxY, .init(x: 7, y: 11))
        XCTAssertEqual(r.maxXminY, .init(x: 10, y: 2))
        XCTAssertEqual(r.maxXmidY, .init(x: 10, y: 6.5))
        XCTAssertEqual(r.maxXmaxY, .init(x: 10, y: 11))
        XCTAssertEqual(r.center, r.midXmidY)
    }
    
}
