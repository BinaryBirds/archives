import MyProjectKit
import OpenAPIRuntime

extension Components.Parameters.todoListSort {

    func todoListSort() throws -> Todo.List.Sort {
        switch self {
        case .title:
            return .title
        }
    }
}

extension Operations.listTodos.Input.Query {

    var mapped: Todo.List.Query {
        get throws {
            .init(
                search: search,
                sort: (try sort?.todoListSort()) ?? .title,
                order: self.order == .desc ? .desc : .asc,
                pageLimit: pageLimit,
                pageOffset: pageOffset
            )
        }
    }
}

extension Todo.List.Item {

    var mapped: Components.Schemas.TodoListItem {
        .init(
            id: id.uuidString,
            title: title
        )
    }
}

extension List<Todo.List.Item> {

    var mapped: Components.Schemas.TodoList {
        .init(
            page: pageMetadata,
            data: .init(
                elements: data.elements.map { $0.mapped },
                count: data.count
            )
        )
    }
}

extension Components.Schemas.TodoCreate {

    var mapped: Todo.Create {
        .init(title: title)
    }
}

extension Todo.Detail {

    var mapped: Components.Schemas.TodoDetail {
        .init(
            id: id.uuidString,
            title: title
        )
    }
}

extension Components.Schemas.TodoPatch {

    var mapped: Todo.Patch {
        .init(title: title)
    }
}
