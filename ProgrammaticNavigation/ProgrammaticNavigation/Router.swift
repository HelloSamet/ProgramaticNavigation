//
//  Router.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import Foundation
import SwiftUI

@Observable
class Router {
    var navPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        
        case todos(TodoDestination)
        case posts(PostDestination)
        case settings
        case custom(message: String)
    }
    
    public enum TodoDestination: Codable, Hashable {
        case list
        case detail(_ todo:Todo)
        
    }
    
    public enum PostDestination: Codable, Hashable {
        case list
        case detail(_ post:Post)
        
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
