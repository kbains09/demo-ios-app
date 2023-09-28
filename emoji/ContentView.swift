//
//  ContentView.swift
//  emoji
//
//  Created by Kirat Bains on 2023-09-27.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var emojiScale: CGFloat = 1.0
    @State private var emojiRotation: Angle = .degrees(0)
    @State private var audioPlayer: AVAudioPlayer?
    
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
        "Success is a journey, not a destination.",
        "Stop being a bitch.",
        "Gym time pussy.",
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
                    .font(.system(size: 100)) // Set the font size for the emoji
                    .scaleEffect(emojiScale)
                    .rotationEffect(emojiRotation)
                    .onTapGesture {
                        // Call a function to generate a random emoji, trigger animations, and play a sound effect
                        withAnimation(.easeInOut(duration: 0.5)) {
                            generateRandomEmoji()
                        }
                    }

                
                Spacer() // Add space between emoji and quote
                
                Text(randomQuote)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3) // Limit to 3 lines of text
                    .foregroundColor(Color.secondary)
                
                Spacer() // Add space between quote and button
                
                Button("Generate Random Emoji") {
                    // Generate a random index to select an emoji and quote from the arrays
                    let randomIndex = Int.random(in: 0..<emojis.count)
                    randomEmoji = emojis[randomIndex]
                    randomQuote = positiveQuotes[randomIndex]
                    
                    // Change the background color to a random color
                    backgroundColor = Color.random
                    
                    // Play a sound effect
                    playSoundEffect()
                }
                .font(.headline)
                .padding()
                
                Spacer() // Add space after the button
            }
            .padding() // Add padding around the entire VStack
        }
        .ignoresSafeArea()
    }

    // Function to generate a random emoji, trigger animations, and play a sound effect
    func generateRandomEmoji() {
        // Add your logic to generate a random emoji
        
        // Animate the scaling and rotation
        withAnimation(.easeInOut(duration: 0.5)) {
            emojiScale = 1.2
            emojiRotation = .degrees(360)
        }
        
        // Reset the scaling and rotation after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                emojiScale = 1.0
                emojiRotation = .degrees(0)
            }
        }
    }
    
    // Function to play a sound effect
    func playSoundEffect() {
        if let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
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
