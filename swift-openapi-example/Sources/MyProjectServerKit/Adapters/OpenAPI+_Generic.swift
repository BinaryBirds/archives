import Foundation
import OpenAPIRuntime
import MyProjectKit

extension List {

    var pageMetadata: Components.Schemas.PageMetadata {
        .init(
            items: page.items,
            current: page.current,
            total: page.total
        )
    }
}
