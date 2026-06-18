import Foundation

public protocol MyProjectKitInterface: Sendable {

    func listTodos(
        _: Todo.List.Query
    ) async throws -> List<Todo.List.Item>

    func createTodo(
        _: Todo.Create
    ) async throws -> Todo.Detail

    func getTodo(
        id: UUID
    ) async throws -> Todo.Detail

    func patchTodo(
        id: UUID,
        _: Todo.Patch
    ) async throws -> Todo.Detail

    func deleteTodo(
        id: UUID
    ) async throws
}
