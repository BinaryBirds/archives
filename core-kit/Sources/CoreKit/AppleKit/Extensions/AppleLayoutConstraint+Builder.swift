//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 21..
//

public extension AppleLayoutConstraint {
    
    @discardableResult
    static func build(
        @Builder<AppleLayoutConstraint> _ block: () -> [AppleLayoutConstraint]
    ) -> [AppleLayoutConstraint] {
        block()
    }
}
