//import Foundation
import Hummingbird
//import HummingbirdFoundation
import HummingbirdFluent
import FluentSQLiteDriver
import Logging
import OpenAPIHummingbird
import MyProjectKit
import MyProjectServerKit

extension HBApplication {

    func configure(_ env: MyProjectServerEnv) throws {
        
//        encoder = JSONEncoder()
//        decoder = JSONDecoder()
        
        addFluent()
        
        if env.isTesting {
            middleware.add(HBLogRequestsMiddleware(.trace))
            fluent.databases.use(.sqlite(.memory), as: .sqlite)
        } 
        else {
            middleware.add(HBLogRequestsMiddleware(.debug))
            fluent.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
        }

        for migration in MyProjectMigrations.v1 {
            fluent.migrations.add(migration)
        }
        try fluent.migrate().wait()
        

        let handler = MyProjectServerAPI(db: db, logger: logger)
        let transport = HBOpenAPITransport(self)
        
        try handler.registerHandlers(
            on: transport,
            serverURL: Servers.server1(),
            middlewares: [
                MyProjectServerMiddleware(),
            ]
        )
    }
}
