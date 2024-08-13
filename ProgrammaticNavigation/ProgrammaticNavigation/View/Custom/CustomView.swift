//
//  CustomView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct CustomView: View {
    let message: String
    @Environment(Router.self) private var router

    var body: some View {
        VStack{
            Spacer()
            Text(message)
                .font(.largeTitle)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem {
                Button("Go to Root"){
                    router.navigateToRoot()
                }
            }
        }
        .navigationTitle("Custom View")
        .safeAreaInset(edge: .bottom) {
            
            NavigationLink(value: Router.Destination.todos(.list), label: {
                Text("Go to Todo List View")
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                    .foregroundStyle(.white)
                    .bold()
                    .background(.blue)
            })
            
        }
    }
}

#Preview {
    CustomView(message: "Gelen Veri")
        .environment(Router())
}
