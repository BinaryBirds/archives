//
//  Request+Mail.swift
//  Mail
//
//  Created by Tibor Bodecs on 2021. 03. 06..
//

public extension Request {

    /// returns the default provider
    var mail: MailProvider { mail(nil) }
    
    /// returns the provider for a given identifier
    func mail(_ id: MailProviderID?) -> MailProvider {
        application.mail(id)
    }
}
