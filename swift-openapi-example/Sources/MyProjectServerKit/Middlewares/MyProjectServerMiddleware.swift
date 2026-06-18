import HTTPTypes
import OpenAPIRuntime

public struct MyProjectServerMiddleware: ServerMiddleware {
    
    public init() {
        // nothing to do here...
    }

    public func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        metadata: ServerRequestMetadata,
        operationID: String,
        next: @Sendable (HTTPRequest, HTTPBody?, ServerRequestMetadata) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        if operationID == "foo" {
            return (
                .init(
                    status: .badRequest,
                    headerFields: [:]
                ),
                nil
            )
        }
        return try await next(request, body, metadata)
    }
}
