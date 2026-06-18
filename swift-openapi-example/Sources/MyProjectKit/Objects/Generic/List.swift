import Foundation

public struct List<T: Codable>: Codable {

    public struct Page: Codable {
        public let items: Int
        public let current: Int
        public let total: Int

        public init(
            items: Int,
            current: Int,
            total: Int
        ) {
            self.items = items
            self.current = current
            self.total = total
        }
    }

    public struct Data<U: Codable>: Codable {
        public let elements: [U]
        public let count: Int

        public init(elements: [U], count: Int) {
            self.elements = elements
            self.count = count
        }
    }

    public let data: Data<T>
    public let page: Page

    public init(
        data: Data<T>,
        page: Page
    ) {
        self.data = data
        self.page = page
    }
}

extension List {

    public func mapped<U: Codable>(_ t: ((T) throws -> U)) throws -> List<U> {
        .init(
            data: .init(
                elements: try data.elements.map { try t($0) },
                count: data.count
            ),
            page: .init(
                items: page.items,
                current: page.current,
                total: page.total
            )
        )
    }
}
