import Foundation
import OpenAPIKit30

extension Server {

    public enum Components {

        public static var error: JSONSchema {
            .object(
                properties: [
                    "code": .integer(
                        required: true,
                        description: "Error code",
                        example: 1
                    ),
                    "message": .string(
                        required: true,
                        description: "The user facing error message",
                        example: "Something went wrong with the request."
                    ),
                    "details": .array(
                        maxItems: 1000,
                        items: .object(
                            properties: [
                                "key": .string(
                                    required: true,
                                    description: "The error key",
                                    example: "field"
                                ),
                                "message": .string(
                                    required: true,
                                    description:
                                        "The user facing error message",
                                    example:
                                        "Something is wrong with the field."
                                ),
                            ]
                        )
                    ),
                ]
            )
        }

        public static var pageMetadata: JSONSchema {
            .object(
                properties: [
                    "items": .integer(
                        required: true,
                        description: "Number of items per page",
                        maximum: (1000, exclusive: false),
                        minimum: (10, exclusive: false),
                        defaultValue: 50,
                        example: 10
                    ),
                    "current": .integer(
                        required: true,
                        description: "The current page number",
                        minimum: (1, exclusive: false),
                        defaultValue: 1,
                        example: 1
                    ),
                    "total": .integer(
                        required: true,
                        description: "Number of total pages",
                        minimum: (0, exclusive: false),
                        defaultValue: 0,
                        example: 42
                    ),
                ]
            )
        }

        public static func pageList(_ reference: String) -> JSONSchema {
            .object(
                properties: [
                    "page": .ref("PageMetadata"),
                    "data": .object(
                        properties: [
                            "elements": .array(
                                maxItems: 1000,
                                items: .reference(.component(named: reference))
                            ),
                            "count": .integer(
                                required: true,
                                description: "Number of total elements",
                                minimum: (0, exclusive: false),
                                defaultValue: 0,
                                example: 420
                            ),
                        ]
                    ),
                ]
            )
        }
    }
}
