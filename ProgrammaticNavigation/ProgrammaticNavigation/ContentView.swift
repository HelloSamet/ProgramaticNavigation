//
//  ContentView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.navPath){
            VStack {
                List{
                    NavigationLink(value: Router.Destination.todos(.list), label: {
                        Label{
                           Text("Todos")
                        } icon : {
                            Image(systemName: "list.bullet.clipboard").foregroundColor(.orange)
                        }
                    })
                    
                    NavigationLink(value: Router.Destination.posts(.list), label: {
                        Label{
                           Text("Posta")
                        } icon : {
                            Image(systemName: "newspaper").foregroundColor(.teal)
                        }
                    })
                    
                    NavigationLink(value: Router.Destination.settings, label: {
                        Label{
                           Text("Settings")
                        } icon : {
                            Image(systemName: "gearshape").foregroundColor(.brown)
                        }
                    })
                    NavigationLink(value: Router.Destination.custom(message: ""), label: {
                        Label{
                           Text("Custo View with Parameter")
                        } icon : {
                            Image(systemName: "circle").foregroundColor(.red)
                        }
                    })
                }
            }.navigationTitle("Navigation Stack")
                .navigationDestination(for: Router.Destination.self, destination: { destination in
                    switch destination {
                    case .todos(let todoDestination):
                        switch todoDestination {
                        case .list:
                            TodoListView()
                        case .detail(let todo):
                            TodoDetailsView(todo: todo)
                        }
                    case .posts(let postDestination):
                        switch postDestination {
                        case .list:
                            PostListView()
                        case .detail(let post):
                            PostDetailsView(post: post)
                        }
                    case .settings: SettingsView()
                    case .custom(message: let message):
                        CustomView(message: message)
                    }
                })
        }
    }
}

#Preview {
    ContentView().environment(Router())
}
