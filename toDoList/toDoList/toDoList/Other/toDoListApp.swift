//
//  toDoListApp.swift
//  toDoList
//

import FirebaseCore
import SwiftUI
import SwiftData

@main
struct toDoListApp: App {
    init(){
        FirebaseApp.configure()//configuring firebase
    }
    var body: some Scene{
        WindowGroup {
            MainView()
        }
    }
}
