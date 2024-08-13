//
//  TodoView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct TodoListView: View {
    
    @State private var todos = [Todo]()
    @State private var isLoading = false
    
    @Environment(Router.self) private var router
    
    var body: some View {
        if isLoading
        {
            ProgressView()
        }
        else
        {
            List
            {
                ForEach(todos) { todo in
                    NavigationLink(value: Router.Destination.todos(.detail(todo)), label: {
                        HStack
                        {
                            Image(systemName: "\(todo.id).circle")
                                .font(.title)
                                .foregroundStyle(.blue)
                            Text(todo.title)
                            Spacer()
                            Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(todo.completed ? .green : .black)
                            
                        }
                    })
                }
            }.task
            {
                await fetchTodos()
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem {
                    NavigationLink(value: Router.Destination.settings, label: {
                        Text("Go to Settings")
                    })
                }
            }
        }
    }
    
    func fetchTodos() async{
        isLoading = true
        let decoder = JSONDecoder()
        do {
            let todos = try decoder.decode([Todo].self, from: todoJsonData!)
            self.todos = todos
            
        } catch  {
            print("Failed to decode Json: \(error)")
        }
        
        isLoading = false
    }
}

#Preview {
    TodoListView().environment(Router())
}
