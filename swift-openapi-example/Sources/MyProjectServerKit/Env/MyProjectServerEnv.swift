import Foundation

public struct MyProjectServerEnv {

    public enum Key: String {
        case hostname = "MY_PROJECT_SERVER_HOSTNAME"
        case port = "MY_PROJECT_SERVER_PORT"
    }

    public enum Defaults {
        public static let hostname: String = "localhost"
        public static let port: Int = 8080
        public static let isTesting: Bool = false
    }

    
    public let hostname: String
    public let port: Int
    public let isTesting: Bool

    public init(
        env: [String: String] = ProcessInfo.processInfo.environment
    ) throws {
        self.hostname = try env.hostname()
        self.port = try env.port()
        self.isTesting = Defaults.isTesting
    }
    
    public init(
        hostname: String = Defaults.hostname,
        port: Int = Defaults.port,
        isTesting: Bool = Defaults.isTesting
    ) {
        self.hostname = hostname
        self.port = port
        self.isTesting = isTesting
    }
}

extension [String: String] {

    fileprivate func hostname() throws -> String {
        let key = MyProjectServerEnv.Key.hostname.rawValue
        if let value = self[key] {
            guard !value.isEmpty else {
                throw MyProjectServerError.invalidHostnameEnvValue
            }
            return value
        }
        return MyProjectServerEnv.Defaults.hostname
    }

    fileprivate func port() throws -> Int {
        let key = MyProjectServerEnv.Key.port.rawValue
        if let value = self[key] {
            guard !value.isEmpty, let intValue = Int(value) else {
                throw MyProjectServerError.invalidPortEnvValue
            }
            return intValue
        }
        return MyProjectServerEnv.Defaults.port
    }
}
