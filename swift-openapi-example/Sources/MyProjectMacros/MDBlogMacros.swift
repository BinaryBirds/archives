import Foundation
import MDBlogMacrosPlugin

@attached(member, names: named(init))
public macro Init(
    accessLevel: InitMacro.AccessLevel = .public,
    defaultValues: [String: Any] = [:],
    exclude: [String] = []
) =
    #externalMacro(
        module: "MDBlogMacrosPlugin",
        type: "InitMacro"
    )
