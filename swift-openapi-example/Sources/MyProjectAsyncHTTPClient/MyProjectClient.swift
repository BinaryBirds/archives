import AsyncHTTPClient
import Foundation
import MyProjectClientKit
import OpenAPIAsyncHTTPClient
import OpenAPIRuntime

public enum MyProjectClient {

    public static func create(
        url: String,
        token: String? = nil,
        httpClient: HTTPClient
    ) -> Client {
        .init(
            serverURL: URL(string: url)!,
            transport: AsyncHTTPClientTransport(
                configuration: .init(
                    client: httpClient
                )
            ),
            middlewares: [
//                AuthClientMiddleware(.bearer(token))
            ]
        )
    }
}

