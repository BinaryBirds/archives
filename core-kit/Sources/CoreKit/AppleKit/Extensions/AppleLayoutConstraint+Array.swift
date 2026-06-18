//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 21..
//

public extension [AppleLayoutConstraint] {

    func activate() {
        AppleLayoutConstraint.activate(self)
    }

    func deactivate() {
        AppleLayoutConstraint.deactivate(self)
    }
}
