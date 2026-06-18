import Foundation
import OpenAPIKit30

extension Todo {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "List todos",
                description: "List available todos",
                operationId: "listTodos",
                parameters: [
                    .ref("pageLimit"),
                    .ref("pageOffset"),
                    .ref("orderAsc"),
                    .ref("todoListSort"),
                    .ref("todoListSearch"),
                ],
                responses: [
                    200: .response(
                        description: "List of todos",
                        content: [
                            .json: .ref("TodoList")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var create: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Create a todo",
                description: "Creates a new todo",
                operationId: "createTodo",
                requestBody: .init(content: [
                    .json: .ref("TodoCreate")
                ]),
                responses: [
                    200: .response(
                        description: "Ok",
                        content: [
                            .json: .ref("TodoDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var bulkDelete: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Bulk delete todos",
                description: "Removes multiple tags at once",
                operationId: "deleteTodos",
                requestBody: .init(content: [
                    .json: .init(
                        schema: .array(
                            maxItems: 1000,
                            items: Fields.id()
                        )
                    )
                ]),
                responses: [
                    204: .ref("204"),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        // MARK: - tag id

        static var head: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Todo head",
                description: "The details of a todo",
                operationId: "headTodo",
                parameters: [
                    .ref("todoId")
                ],
                responses: [
                    200: .response(
                        description: "The details of a todo",
                        headers: [
                            "Content-Length": .header(.init(schema: .integer)),
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var detail: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Todo details",
                description: "Get the details of a todo",
                operationId: "getTodo",
                parameters: [
                    .ref("todoId")
                ],
                responses: [
                    200: .response(
                        description: "The details of a todo",
                        content: [
                            .json: .ref("TodoDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var update: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Update a todos",
                description: "Updates a todo",
                operationId: "updateTodo",
                parameters: [
                    .ref("todoId")
                ],
                requestBody: .init(content: [
                    .json: .ref("TodoUpdate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the updated todo",
                        content: [
                            .json: .ref("TodoDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var patch: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Patch a todo",
                description: "Patch a given todo",
                operationId: "patchTodo",
                parameters: [
                    .ref("todoId")
                ],
                requestBody: .init(content: [
                    .json: .ref("TodoPatch")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the patched todo",
                        content: [
                            .json: .ref("TodoDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var delete: OpenAPI.Operation {
            .init(
                tags: ["Todo"],
                summary: "Delete a todo",
                description: "Removes a todo using an id",
                operationId: "deleteTodo",
                parameters: [
                    .ref("todoId")
                ],
                responses: [
                    204: .ref("204"),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

    }
}
