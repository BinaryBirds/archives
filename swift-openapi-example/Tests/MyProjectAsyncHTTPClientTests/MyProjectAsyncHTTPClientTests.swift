import XCTest

@testable import MyProjectAsyncHTTPClient

final class MyProjectAsyncHTTPClientTests: XCTestCase {
    
    func testExample() async throws {
        XCTAssertTrue(true)
    }
}


//import AsyncHTTPClient
//import Dispatch
//import Foundation
//import Logging
//import NIO
//import OpenAPIAsyncHTTPClient
//import OpenAPIRuntime
//
//enum Entrypoint {
//
//    static func main() async throws {
//        let httpClient = HTTPClient(
//            eventLoopGroupProvider: .singleton
//        )
//
//        let client = Client(
//            serverURL: try Servers.server1(),
//            transport: AsyncHTTPClientTransport(
//                configuration: .init(
//                    client: httpClient
//                )
//            ),
//            middlewares: [
//                AuthClientMiddleware(.bearer("token")),
//            ]
//        )
//
//        let logger = {
//            var logger = Logger(label: "client")
//            logger.logLevel = .debug
//            return logger
//        }()
//
//        do {
//            logger.debug("CPU core count: \(System.coreCount)")
//
//            let startTime = DispatchTime.now()
//
//            let response = try await client.listTags(
//                .init(
//                    path: .init(
//                        siteId: "foo"
//                    )
//                )
//            )
//
//            switch response {
//            case .ok(_):
//                print("ok")
//            default:
//                print("not ok")
//            }
//
//            let endTime = DispatchTime.now()
//            let nanoTime =
//                endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
//            let timeInterval = Double(nanoTime) / 1_000_000_000
//            logger.debug("Total time: \(timeInterval) seconds")
//        }
//        catch {
//            print(error)
//        }
//
//        /// always shut down httpClient
//        try await httpClient.shutdown()
//    }
//}
