//
//  Book.swift
//  Bookworm
//
//  Created by Mayur on 11/08/24.
//

import Foundation
import SwiftData

@Model
class Book{
    var name: String
    var author: String
    var genere: String
    var review: String
    var rating: Int
    
    init(name: String, author: String, genere: String, review: String, rating: Int) {
        self.name = name
        self.author = author
        self.genere = genere
        self.review = review
        self.rating = rating
    }
}

