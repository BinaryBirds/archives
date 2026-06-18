//
//  Application+Mail.swift
//  Mail
//
//  Created by Tibor Bodecs on 2021. 03. 06..
//

public extension Application {

    /// returns the default mail provider
    var mail: MailProvider { mail(nil) }
    
    /// returns the mail provider for a given identifier
    func mail(_ id: MailProviderID?) -> MailProvider {
        mailService.storage.providers.provider(id, logger: logger, on: eventLoopGroup.next())!
    }
}
