//
//  PostDetailsView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct PostDetailsView: View {
    let post: Post
    @Environment(Router.self) private var router
    var body: some View {
        VStack(alignment: .leading) 
        {
            Text(post.title)
                .font(.headline)
            
            Text(post.body)
                .font(.subheadline)
            
        }
        .padding()
        .toolbar {
            ToolbarItem {
                Button(action: {
                    router.navigateToRoot()
                }, label: {
                    Text("Go to Root")
                })
            }
        }
        .navigationTitle("Post Detail")
    }
}

#Preview {
    PostDetailsView(post: Post(id: 1, title: "", body: "")).environment(Router())
}
