import Foundation
import OpenAPIKit30

extension Todo {

    enum Fields {

        static func id(description: String = "Unique identifier") -> JSONSchema
        {
            .string(
                format: .extended(.uuid),
                required: true,
                description: description,
                example: "7B8154FE-C507-4810-8EAF-5AB30B90EC89"
            )
        }

        static func title(required: Bool = true) -> JSONSchema {
            .string(
                format: .generic,
                required: required,
                description: "Title of the todo item",
                example: "Get milk"
            )
        }
    }
}
