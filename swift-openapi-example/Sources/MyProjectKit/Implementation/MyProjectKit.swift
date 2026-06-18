@preconcurrency import FluentKit
import Logging

public struct MyProjectKit: MyProjectKitInterface {

    let db: Database
    let logger: Logger

    public init(
        db: Database,
        logger: Logger = .init(label: "my-project-kit")
    ) {
        self.db = db
        self.logger = logger
    }
}
