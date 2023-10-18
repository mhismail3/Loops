//
//  TasksApp.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import FirebaseCore
import SwiftUI

@main
struct TasksApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
