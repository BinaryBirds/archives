import Foundation
import HTTPTypes
import OpenAPIRuntime

public struct AuthClientMiddleware: ClientMiddleware {

    public enum Scheme: Sendable {
        case basic(String)
        case bearer(String)
        case digest(String)
        case custom(String)
    }

    private let scheme: Scheme?

    public init(_ scheme: Scheme? = nil) {
        self.scheme = scheme
    }
    
    public func intercept(
        _ request: HTTPRequest, 
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: @Sendable (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?))
    async throws -> (HTTPResponse, HTTPBody?) {
        guard let scheme else {
            return try await next(request, body, baseURL)
        }
        var req = request
        switch scheme {
        case .basic(let credentials):
            req.headerFields.append(
                .init(
                    name: .authorization,
                    value: "Basic \(credentials)"
                )
            )
        case .bearer(let token):
            req.headerFields.append(
                .init(
                    name: .authorization,
                    value: "Bearer \(token)"
                )
            )
        case .digest(let value):
            req.headerFields.append(
                .init(
                    name: .authorization,
                    value: "Digest \(value)"
                )
            )
        case .custom(let value):
            req.headerFields.append(
                .init(
                    name: .authorization,
                    value: value
                )
            )
        }
        return try await next(req, body, baseURL)
    }
}
