import Foundation
import OpenAPIKit30
import Yams

let doc = OpenAPI.Document.definition
let encoder = YAMLEncoder()
let yaml = try encoder.encode(doc)

let basePath = #file
    .split(separator: "/")
    .dropLast(3)
    .joined(separator: "/")

let paths = [
    "/\(basePath)/OpenAPI/openapi.yaml",
    "/\(basePath)/Sources/MyProjectClientKit/openapi.yaml",
    "/\(basePath)/Sources/MyProjectServerKit/openapi.yaml",
]

for path in paths {
    try yaml.write(
        to: URL(fileURLWithPath: path),
        atomically: true,
        encoding: .utf8
    )
}
