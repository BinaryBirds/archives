import Foundation

extension MyProjectKit {

    public func listTodos(
        _: Todo.List.Query
    ) async throws -> List<Todo.List.Item> {
        fatalError()
    }

    public func createTodo(
        _: Todo.Create
    ) async throws -> Todo.Detail {
        fatalError()
    }

    public func getTodo(
        id: UUID
    ) async throws -> Todo.Detail {
        fatalError()
    }

    public func patchTodo(
        id: UUID,
        _: Todo.Patch
    ) async throws -> Todo.Detail {
        fatalError()
    }

    public func deleteTodo(
        id: UUID
    ) async throws {
        fatalError()
    }
}
