import FluentKit
import Foundation
import MyProjectKit
import OpenAPIRuntime

public extension MyProjectServerAPI {

    func headTodo(_ input: Operations.headTodo.Input) async throws
        -> Operations.headTodo.Output
    {
        .ok(.init(headers: .init(Content_hyphen_Length: 42)))
    }

    func deleteTodo(_ input: Operations.deleteTodo.Input) async throws
        -> Operations.deleteTodo.Output
    {
        fatalError()
    }

    func updateTodo(_ input: Operations.updateTodo.Input) async throws
        -> Operations.updateTodo.Output
    {
        fatalError()
    }

    func patchTodo(_ input: Operations.patchTodo.Input) async throws
        -> Operations.patchTodo.Output
    {
        fatalError()
    }

    func getTodo(_ input: Operations.getTodo.Input) async throws
        -> Operations.getTodo.Output
    {
        fatalError()
    }

    func deleteTodos(_ input: Operations.deleteTodos.Input) async throws
        -> Operations.deleteTodos.Output
    {
        fatalError()
    }

    func listTodos(_ input: Operations.listTodos.Input) async throws
        -> Operations.listTodos.Output
    {
        fatalError()
    }

    func createTodo(_ input: Operations.createTodo.Input) async throws
        -> Operations.createTodo.Output
    {
        switch input.body {
        case .json(let body):
            do {
                //                let result = try await service.createNamespace(body.mapped)
                return .ok(.init(body: .json(.init(id: "", title: ""))))
            }
            catch {
                fatalError()
                return .badRequest(
                    .init(body: .json(.init(code: 0, message: "", details: [])))
                )
            }
        default:
            return .badRequest(
                .init(body: .json(.init(code: 0, message: "", details: [])))
            )
        }
    }

}
