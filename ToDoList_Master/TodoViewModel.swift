//
//  TodoViewModel.swift
//  ToDoList_Master
//
//  Created by Matthew Segura on 2/7/26.
//

import SwiftUI
import Combine

struct Todo: Identifiable{
    var id = UUID()
    var title: String
    var date = Date()
    var isDone: Bool = false
}

@MainActor
final class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func add(_ title: String) {
        guard !title.isEmpty else { return }
        todos.insert(Todo(title: title), at: 0)
    }

    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggle(_ todo: Todo) {
            guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
            todos[index].isDone.toggle()
        }
}
