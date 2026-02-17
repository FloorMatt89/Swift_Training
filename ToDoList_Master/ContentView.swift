//
//  ContentView.swift
//  ToDoList_Master
//
//  Created by Matthew Segura on 2/7/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = TodoViewModel()
    @State private var newTodo = ""

    var body: some View {
            VStack {
                Text("My To Do List")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                List {
                    ForEach(vm.todos) { todo in
                

                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .strikethrough(todo.isDone)
                                .font(.headline)

                            Text(todo.date.formatted())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
  
                    }  
                    .onDelete(perform: vm.delete)
                }

                HStack {
                    TextField("New task", text: $newTodo)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        vm.add(newTodo)
                        newTodo = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
}

#Preview {
    ContentView()
}

