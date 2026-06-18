//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

public extension AppleEdgeInsets {

    init(all value: CGFloat = 0) {
        self.init(top: value, left: value, bottom: value, right: value)
    }

    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
