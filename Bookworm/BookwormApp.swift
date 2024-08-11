//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mayur on 11/08/24.
//
import CoreData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
