import ArgumentParser
import Hummingbird
import MyProjectServerKit

@main
struct Entrypoint: ParsableCommand {

    func run() throws {
        let env = try MyProjectServerEnv()
        let app = HBApplication(
            configuration: .init(
                address: .hostname(env.hostname, port: env.port),
                serverName: "MyProjectServer"
            )
        )
        try app.configure(env)
        try app.start()
        app.wait()
    }
}
