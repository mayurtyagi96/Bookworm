//
//  ContentView.swift
//  Bookworm
//
//  Created by Mayur on 11/08/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Book.name),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    @State private var showAddBookView = false
    
    var body: some View {
        NavigationStack{
            List(){
                ForEach(books){ book in
                    NavigationLink(value: book) {
                        HStack(){
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.name)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .sheet(isPresented: $showAddBookView, content: {
                AddBookView()
            })
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus"){
                        showAddBookView = true
                    }
                }
            }
        }
    }
    func deleteBook(for indices: IndexSet){
        for index in indices{
            modelContext.delete(books[index])
        }
        
    }
}

#Preview {
    ContentView()
}
