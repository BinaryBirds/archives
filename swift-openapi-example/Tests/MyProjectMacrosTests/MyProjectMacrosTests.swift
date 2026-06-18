import MDBlogMacrosPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacroExpansion
import SwiftSyntaxMacros
import XCTest

final class MyProjectMacrosTests: XCTestCase {

    let testMacros: [String: Macro.Type] = [
        "Init": InitMacro.self
    ]

    func testApiObjects() throws {

        let sf: SourceFileSyntax = """
            @Init
            public struct Something: Codable {
                let foo: String
                let bar: Int
                let hello: Bool?
            }
            """

        let expectation = """

            public struct Something: Codable {
                let foo: String
                let bar: Int
                let hello: Bool?

                public init(
                    foo: String,
                    bar: Int,
                    hello: Bool?
                ) {
                    self.foo = foo
                    self.bar = bar
                    self.hello = hello
                }
            }
            """

        let context = BasicMacroExpansionContext(
            sourceFiles: [
                sf: .init(
                    moduleName: "TestModule",
                    fullFilePath: "test.swift"
                )
            ]
        )

        let transformed = sf.expand(macros: testMacros, in: context)
        XCTAssertEqual(transformed.formatted().description, expectation)
    }
}
