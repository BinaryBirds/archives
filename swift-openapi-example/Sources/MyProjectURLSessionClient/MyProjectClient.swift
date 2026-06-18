import Foundation
import MyProjectClientKit
import OpenAPIURLSession
import OpenAPIRuntime

public enum MyProjectClient {

    public static func create(
        url: String,
        token: String? = nil,
        session: URLSession = .shared
    ) -> Client {
        .init(
            serverURL: URL(string: url)!,
            transport: URLSessionTransport(
                configuration: .init(session: session)
            ),
            middlewares: [
//                AuthClientMiddleware(.bearer(token))
            ]
        )
    }
}
