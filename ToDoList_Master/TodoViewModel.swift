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
}
