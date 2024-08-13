//
//  SettingsView.swift
//  ProgrammaticNavigation
//
//  Created by Abdulsamet Göçmen on 12.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedTheme: Int = 0
    @State private var volumeLevel: Float = 50.0
    
    @Environment(Router.self) private var router
    var body: some View {
        VStack{
            Form{
                Toggle(isOn: .constant(false), label: {
                    Text("Enable Notification")
                })
                
                Picker(selection: $selectedTheme, content: {
                    Text("Light").tag(0)
                    Text("Dark").tag(1)
                    Text("System").tag(2)
                }, label: {
                    Text("Theme")
                }).pickerStyle(.segmented)
                
                HStack{
                    Text("Volume")
                    Slider(value: $volumeLevel, in: 0...100)
                }
                
                Button(action: {
                    print("Settings Saved")
                }, label: {
                    Text("Save Settings").foregroundColor(.blue)
                }).navigationTitle("Settings")
                    .toolbar(content: {
                        ToolbarItem(content: {
                            Button(action: {
                                router.navigateToRoot()
                            }, label: {
                                Text("Go to Root")
                            })
                        })
                    })
            }
        }
    }
}

#Preview {
    SettingsView().environment(Router())
}
