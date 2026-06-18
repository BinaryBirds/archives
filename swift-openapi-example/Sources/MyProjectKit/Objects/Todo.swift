import Foundation

public enum Todo {

    public struct Create: Codable {
        public let title: String

        public init(
            title: String
        ) {
            self.title = title
        }
    }

    public struct Patch: Codable {
        public let title: String?

        public init(
            title: String?
        ) {
            self.title = title
        }
    }

    public enum List {

        public enum Sort: String, Codable {
            case title
        }

        public struct Query: Codable {
            public let search: String?
            public let sort: Sort
            public let order: Order
            public let pageLimit: Int
            public let pageOffset: Int

            public init(
                search: String? = nil,
                sort: Sort = .title,
                order: Order = .asc,
                pageLimit: Int? = nil,
                pageOffset: Int? = nil
            ) {
                self.search = search
                self.sort = sort
                self.order = order
                self.pageLimit = pageLimit ?? Page.limit
                self.pageOffset = pageOffset ?? Page.offset
            }
        }

        public struct Item: Codable {
            public let id: UUID
            public let title: String

            public init(
                id: UUID,
                title: String
            ) {
                self.id = id
                self.title = title
            }
        }
    }

    public struct Detail: Codable {
        public let id: UUID
        public let title: String

        public init(
            id: UUID,
            title: String
        ) {
            self.id = id
            self.title = title
        }
    }
}
