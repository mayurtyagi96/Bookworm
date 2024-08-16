//
//  RatingView.swift
//  Bookworm
//
//  Created by Mayur on 12/08/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var maxRating = 5
    var starImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            ForEach(1..<maxRating+1, id: \.self){ number in
                Button{
                    rating = number
                } label: {
                    starImage
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
//    func image(for number: Int) -> Bool{
//        if number > rating{
//            return  false
//        }
//        return true
//    }
}

#Preview {
    RatingView(rating: .constant(1))
}
