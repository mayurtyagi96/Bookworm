//
//  ContentView.swift
//  Bookworm
//
//  Created by Mayur on 11/08/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var books: [Book]
    @State private var showAddBookView = false
    
    var body: some View {
        NavigationStack{
            Text("No. of books \(books.count)")
                .sheet(isPresented: $showAddBookView, content: {
                    AddBookView()
                })
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus"){
                            showAddBookView = true
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
