import FluentKit

struct TodoSchemaMigration: AsyncMigration {

    func prepare(on db: Database) async throws {
        try await db.schema(TodoModel.schema)
            .id()
            .field(TodoModel.FieldKeys.title, .string, .required)
            .field(TodoModel.FieldKeys.isCompleted, .bool, .required)
            .create()
    }

    func revert(on db: Database) async throws {
        try await db.schema(TodoModel.schema)
            .delete()
    }
}
