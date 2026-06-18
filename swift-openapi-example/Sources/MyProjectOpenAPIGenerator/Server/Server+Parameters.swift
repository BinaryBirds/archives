import Foundation
import OpenAPIKit30

extension Server {

    public enum Parameters {

        public static var pageOffset: OpenAPI.Parameter {
            let name = "pageOffset"
            return .init(
                name: name,
                context: .query,
                schema: .integer(
                    title: name,
                    minimum: (1, exclusive: false),
                    defaultValue: 1,
                    example: 1
                ),
                description: "The offset of the current page number"
            )
        }

        public static var pageLimit: OpenAPI.Parameter {
            let name = "pageLimit"
            return .init(
                name: name,
                context: .query,
                schema: .integer(
                    title: name,
                    minimum: (1, exclusive: false),
                    defaultValue: 50,
                    example: 10
                ),
                description: "Limit the number of items per page"
            )
        }

        public static func order(desc: Bool = false) -> OpenAPI.Parameter {
            .init(
                name: "order",
                context: .query,
                schema: .string(
                    allowedValues: "asc",
                    "desc",
                    defaultValue: desc ? "desc" : "asc",
                    example: desc ? "desc" : "asc"
                ),
                description: "Order the results ascending or descending"
            )
        }
    }
}
