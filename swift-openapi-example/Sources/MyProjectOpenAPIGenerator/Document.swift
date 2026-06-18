import OpenAPIKit30

extension OpenAPI.Document {

    static var definition: OpenAPI.Document {
        .init(
            info: .init(
                title: "MyProject API",
                description: "API for the my project server.",
                contact: .init(
                    name: "Binary Birds",
                    url: .init(string: "https://binarybirds.com")!,
                    email: "info@binarybirds.com"
                ),
                version: "1.0.0"
            ),
            servers: [
                .init(
                    url: .init(string: "http://127.0.0.1:8080")!,
                    description: "dev"
                ),
                .init(
                    url: .init(string: "http://127.0.0.1:8081")!,
                    description: "live"
                ),
            ],
            paths: [
                "/todos": .init(
                    get: Todo.Operations.list,
                    post: Todo.Operations.create,
                    delete: Todo.Operations.bulkDelete
                ),
                "/todos/{todoId}": .init(
                    get: Todo.Operations.detail,
                    put: Todo.Operations.update,
                    delete: Todo.Operations.delete,
                    head: Todo.Operations.head,
                    patch: Todo.Operations.patch
                ),
            ],
            components: .init(
                schemas: [
                    "ErrorResponse": Server.Components.error,
                    "PageMetadata": Server.Components.pageMetadata,

                    // todos
                    "TodoList": Server.Components.pageList("TodoListItem"),
                    "TodoListItem": Todo.Components.list,
                    "TodoReference": Todo.Components.reference,
                    "TodoDetail": Todo.Components.detail,
                    "TodoCreate": Todo.Components.create,
                    "TodoUpdate": Todo.Components.update,
                    "TodoPatch": Todo.Components.patch,

                ],
                responses: [
                    "204": .init(description: "No content"),
                    "400": Server.Responses.error("Bad request"),
                    "401": Server.Responses.error("Unauthorized"),
                    "403": Server.Responses.error("Forbidden"),
                    "404": Server.Responses.error("Not found"),
                ],
                parameters: [
                    // path
                    "todoId": Todo.Parameters.id,
                    "todoListSearch": Todo.Parameters.List.search,
                    "todoListSort": Todo.Parameters.List.sort,
                    
                    // query
                    "pageOffset": Server.Parameters.pageOffset,
                    "pageLimit": Server.Parameters.pageLimit,
                    "orderAsc": Server.Parameters.order(),
                    "orderDesc": Server.Parameters.order(desc: true),
                ],
                examples: [:],
                requestBodies: [:],
                headers: [:],
                securitySchemes: [
                    "bearerAuth": Server.SecuritySchemes.bearerToken()
                ]
            ),
            tags: [
                .init(
                    name: "Todo",
                    description: "Everything about todos..."
                )
            ]
        )
    }
}
