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
    @State private var showValidiationAlert = false

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
                
                RatingView(rating: $rating)
                
            }
            Section{
                Button("Save"){
                    // here we can set either default value or validiate form in case of no text.
//                    if validiate(){
                        setDefaultValues()
                        let book = Book(name: name, author: author, genere: genere, review: review, rating: rating)
                        modelContext.insert(book)
                        dismiss()
//                    }
                }
            }
        }
        .navigationTitle("Add Book")
        .alert("Alert", isPresented: $showValidiationAlert) {
            Button("OK", action: { } )
        } message: {
            Text("Please fill all the mandatory fields")
        }

    }
    
    func setDefaultValues(){
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                name = "N/A"
        }
        if author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            author = "Unknown"
        }
    }
    func validiate() -> Bool{
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            showValidiationAlert = true
            return false
        }
        return true
    }
    
}

#Preview {
    AddBookView()
}
