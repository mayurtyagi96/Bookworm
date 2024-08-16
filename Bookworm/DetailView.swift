//
//  DetailView.swift
//  Bookworm
//
//  Created by Mayur on 15/08/24.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteAlert = false
    let book: Book
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genere)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genere.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
                    
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete Book", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cance", role: .cancel) { }
        } message: {
            Text("Are you sure")
        }
        .toolbar{
            Button("Delete this book", systemImage: "trash") {
                showDeleteAlert = true
            }
        }
    }
    
    func deleteBook(){
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let book = Book(name: "Test Name", author: "Test Author", genere: "Fantasy", review: "This a great book", rating: 1)
        return DetailView(book: book)
            .modelContainer(container)
    }catch{
       return Text("Failed to load detail view \(error.localizedDescription)")
    }
}
