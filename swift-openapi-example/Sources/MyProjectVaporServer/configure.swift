import Fluent
import FluentSQLiteDriver
import MyProjectServerKit
import MyProjectKit
import OpenAPIVapor
import Vapor

public func configure(
    _ app: Application,
    _ env: MyProjectServerEnv
) async throws {

    app.http.server.configuration.hostname = env.hostname
    app.http.server.configuration.port = env.port
    app.routes.defaultMaxBodySize = "16kb"

    if env.isTesting {
        app.logger.logLevel = .trace
        app.databases.use(.sqlite(.memory), as: .sqlite)
    }
    else {
        app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    }

    for migration in MyProjectMigrations.v1 {
        app.migrations.add(migration)
    }
    try await app.autoMigrate().get()

    let transport = VaporTransport(routesBuilder: app)
    let handler = MyProjectServerAPI(db: app.db, logger: app.logger)
    try handler.registerHandlers(
        on: transport,
        serverURL: Servers.server1(),
        middlewares: [
            MyProjectServerMiddleware(),
        ]
    )
}
