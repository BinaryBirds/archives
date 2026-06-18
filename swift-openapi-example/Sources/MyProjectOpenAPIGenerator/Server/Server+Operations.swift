import Foundation
import OpenAPIKit30

extension Server {

    public enum Operations {

        public static var health: OpenAPI.Operation {
            .init(
                tags: ["Server"],
                summary: "Server health check",
                description: "Use this endpoint for health checks",
                operationId: "healthCheck",
                responses: [
                    200: .response(description: "Ok")
                ]
            )
        }
    }
}
