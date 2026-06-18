import FluentKit
import Foundation
import MyProjectKit
import OpenAPIRuntime

public struct MyProjectServerAPI: APIProtocol {

    let service: MyProjectKitInterface
    let logger: Logger

    public init(
        db: Database,
        logger: Logger = .init(label: "my-project-server-api")
    ) {
        self.service = MyProjectKit(
            db: db,
            logger: logger
        )
        self.logger = logger
    }
}
