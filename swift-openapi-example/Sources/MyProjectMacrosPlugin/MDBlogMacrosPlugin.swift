import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MDBlogMacrosPlugin: CompilerPlugin {

    let providingMacros: [Macro.Type] = [
        InitMacro.self
    ]
}
