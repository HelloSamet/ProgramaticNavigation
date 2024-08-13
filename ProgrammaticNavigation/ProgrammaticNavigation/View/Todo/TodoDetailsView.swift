//
//  TodoDetailsView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct TodoDetailsView: View {
    let todo: Todo
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text(todo.title)
                .font(.largeTitle)
            
            Text(todo.completed ? "Tamamlandi" : "Tamamlanamadi")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.clear)
                .overlay(content: {
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue, .yellow, .pink]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(
                        Text(todo.completed ? "Tamamlandı" : "Tamamlanmadı")
                            .font(.title)
                            .fontWeight(.bold)
                    )
                })
        }.padding()
        .toolbar {
            ToolbarItem {
                Button(action: {
                    router.navigateToRoot()
                }, label: {
                    Text("Go to Root")
                })
            }
        }
        .navigationTitle("Todo Detail")
    }
}

#Preview {
    TodoDetailsView(todo: Todo(userId: 23, id: 2, title: "", completed: false))
        .environment(Router())
}
