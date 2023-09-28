//
//  ContentView.swift
//  emoji
//
//  Created by Kirat Bains on 2023-09-27.
//

import SwiftUI

struct ContentView: View {
    // Define an array of emojis and positive quotes
    let emojis = ["😀", "😎", "🚀", "🌟", "🐱", "🌈", "🍔", "🎉"]
    let positiveQuotes = [
        "Stay positive and keep smiling!",
        "You're amazing just the way you are.",
        "Believe in yourself and your dreams.",
        "Every day is a new opportunity.",
        "You've got this!",
        "Shine bright like a star!",
        "Life is beautiful.",
        "Success is a journey, not a destination."
    ]
    
    // State variables
    @State private var randomEmoji = "😀"
    @State private var randomQuote = ""
    @State private var backgroundColor = Color.white // Initial background color
    
    var body: some View {
        ZStack {
            backgroundColor // Set the background color
            
            VStack {
                Text(randomEmoji)
                    .font(.system(size: 50))
                
                Text(randomQuote)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3) // Limit to 3 lines of text
                    .foregroundColor(Color.secondary)
                
                Button("Generate Random Emoji") {
                    // Generate a random index to select an emoji and quote from the arrays
                    let randomIndex = Int.random(in: 0..<emojis.count)
                    randomEmoji = emojis[randomIndex]
                    randomQuote = positiveQuotes[randomIndex]
                    
                    // Change the background color to a random color
                    backgroundColor = Color.random
                }
                .font(.headline)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

extension Color {
    // Generate a random color
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
