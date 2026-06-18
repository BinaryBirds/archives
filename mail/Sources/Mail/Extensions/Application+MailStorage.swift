//
//  Application+MailStorage.swift
//  Mail
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

extension Application {

    public struct Mail {

        final class Storage {
            let providers: MailProviders

            init() {
                self.providers = MailProviders()
            }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        struct Lifecycle: LifecycleHandler {
            func shutdown(_ application: Application) {
                application.mailService.storage.providers.shutdown()
            }
        }

        let application: Application

        var storage: Storage {
            if application.storage[Key.self] == nil {
                initialize()
            }
            return application.storage[Key.self]!
        }

        func initialize() {
            application.storage[Key.self] = .init()
            application.lifecycle.use(Lifecycle())
        }
    }


    public var mailService: Mail { .init(application: self) }
    
    public var mailProviders: MailProviders { mailService.storage.providers }
}




