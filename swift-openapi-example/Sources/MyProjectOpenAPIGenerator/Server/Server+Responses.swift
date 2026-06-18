import OpenAPIKit30

extension Server {

    public enum Responses {

        public static func error(_ description: String) -> OpenAPI.Response {
            .init(
                description: description,
                content: [
                    .json: .init(
                        schema: .reference(
                            .component(named: "ErrorResponse")
                        )
                    )
                ]
            )
        }
    }
}
