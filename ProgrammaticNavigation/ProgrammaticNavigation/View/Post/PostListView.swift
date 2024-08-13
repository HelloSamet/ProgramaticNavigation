//
//  PostListView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct PostListView: View {
    
    @State private var posts = [Post]()
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
                ForEach(posts) { post in
                    NavigationLink(value: Router.Destination.posts(.detail(post)), label: {
                        HStack
                        {
                            Image(systemName: "\(post.id).circle")
                                .font(.title)
                                .foregroundStyle(.blue)
                            Text(post.title)
                        }
                    })
                }
            }.task
            {
                await fetchPosts()
            }
            .navigationTitle("Posts")
        }
    }
    
    func fetchPosts() async{
        isLoading = true
        let decoder = JSONDecoder()
        do {
            let posts = try decoder.decode([Post].self, from: postJsonData!)
            self.posts = posts
            
        } catch  {
            print("Failed to decode Json: \(error)")
        }
        
        isLoading = false
    }
}

#Preview {
    PostListView().environment(Router())
}
