import Foundation
import OpenAPIKit30

extension Todo {

    enum Components {

        static var reference: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "title": Fields.title(),
                ]
            )
        }

        static var list: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "title": Fields.title(),
                ]
            )
        }

        static var detail: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "title": Fields.title(),
                ]
            )
        }

        static var create: JSONSchema {
            .object(
                properties: [
                    "title": Fields.title()
                ]
            )
        }

        static var update: JSONSchema {
            .object(
                properties: [
                    "title": Fields.title()
                ]
            )
        }

        static var patch: JSONSchema {
            .object(
                properties: [
                    "title": Fields.title(required: false)
                ]
            )
        }
    }

}
