//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mayur on 11/08/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var author = ""
    @State private var genere = "Kids"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        Form{
            Section{
                TextField("Name of Book", text: $name)
                TextField("Name of Author", text: $author)
                
                Picker("Genere", selection: $genere) {
                    ForEach(genres, id: (\.self)){
                        Text($0)
                    }
                }
            }
            Section("Write a review"){
                TextEditor(text: $review)
                
                Picker("Select the rating for this book", selection: $rating) {
                    ForEach(0..<6){
                        Text("\($0)")
                    }
                }
            }
            
            Section{
                Button("Save"){
                    let book = Book(name: name, author: author, genere: genere, review: review, rating: rating)
                    modelContext.insert(book)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Book")
    }
}

#Preview {
    AddBookView()
}
