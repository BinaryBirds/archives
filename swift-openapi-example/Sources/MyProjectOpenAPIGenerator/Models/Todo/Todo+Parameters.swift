import Foundation
import OpenAPIKit30

extension Todo {

    enum Parameters {

        static var id: OpenAPI.Parameter {
            .init(
                name: "todoId",
                context: .path,
                schema: Fields.id()
            )
        }
        
        enum List {

            static var search: OpenAPI.Parameter {
                .init(
                    name: "search",
                    context: .query,
                    schema: Fields.title(),
                    description:
                        "Search term for a todo item, partial match the title field"
                )
            }

            static var sort: OpenAPI.Parameter {
                .init(
                    name: "sort",
                    context: .query,
                    schema: .string(
                        format: .generic,
                        allowedValues: "title",
                        defaultValue: "title",
                        example: "title"
                    ),
                    description: "Sort of the list"
                )
            }
        }
    }
}
