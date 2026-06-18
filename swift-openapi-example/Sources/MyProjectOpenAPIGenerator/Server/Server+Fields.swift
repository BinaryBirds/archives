import Foundation
import OpenAPIKit30

extension Server {

    public enum Fields {

        public static func errorCode(
            description: String = ""
        ) -> JSONSchema {
            .integer(
                required: true,
                description: description,
                maximum: (255, exclusive: false),
                minimum: (0, exclusive: false),
                example: 0
            )
        }

        public static func uuid(
            description: String = "Unique identifier"
        ) -> JSONSchema {
            .string(
                format: .extended(.uuid),
                required: true,
                description: description,
                example: "80AC5349-BCD6-4C36-AFBF-AAE6AD9AAB98"
            )
        }

        public static func createdAt(
            description: String = "Object creation date"
        ) -> JSONSchema {
            .string(
                format: .dateTime,
                required: true,
                description: description,
                example: "2020-01-02T10:11:12.000Z"
            )
        }

        public static func updatedAt(
            description: String = "Last update for the object"
        ) -> JSONSchema {
            .string(
                format: .dateTime,
                required: true,
                description: description,
                example: "2021-02-03T11:12:13.000Z"
            )
        }
    }
}
