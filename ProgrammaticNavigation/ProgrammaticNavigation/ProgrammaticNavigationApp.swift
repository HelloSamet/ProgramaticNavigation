//
//  ProgrammaticNavigationApp.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

@main
struct ProgrammaticNavigationApp: App {
    @State private var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(router)
        }
    }
}
