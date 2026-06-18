import FluentKit

final class TodoModel: Model {

    static let schema = "todos"

    struct FieldKeys {
        static let title: FieldKey = "title"
        static let isCompleted: FieldKey = "is_completed"
    }

    @ID(key: .id)
    var id: UUID?

    @Field(key: FieldKeys.title)
    var title: String

    @Field(key: FieldKeys.isCompleted)
    var isCompleted: Bool

    init() {}

    init(
        id: UUID? = nil,
        title: String,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
