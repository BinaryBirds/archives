//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

public protocol LayoutAnchorRepresentable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

#if canImport(UIKit)
extension UIView: LayoutAnchorRepresentable {}
extension UILayoutGuide: LayoutAnchorRepresentable {}
#endif

#if canImport(AppKit)
extension NSView: LayoutAnchorRepresentable {}
extension NSLayoutGuide: LayoutAnchorRepresentable {}
#endif
