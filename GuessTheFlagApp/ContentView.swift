//
//  ContentView.swift
//  GuessTheFlagApp
//
//  Created by Ангелина Шаманова on 17.11.22..
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany",
                                    "Ireland", "Italy", "Nigeria",
                                    "Poland", "Russia", "Spain",
                                    "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    
    @State private var numberOfSteps = 0
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color.mint, location: 0.3),
                .init(color: Color.indigo, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Tap the flag of")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.secondary)
                Text(countries[correctAnswer])
                    .font(.largeTitle.weight(.semibold))
                VStack(spacing: 15) {
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(
                                    Rectangle())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingAlert) {
            if numberOfSteps < 8 {
                Button("Continue", action: askQuestion)
            } else {
                Button("Start again", role: .cancel, action: reset)
                Button("Cancel", role: .destructive, action: reset)
            }
        } message: {
            Spacer()
            Spacer()
            Text(scoreMessage)
            Spacer()
        }
    }
    
    func flagTapped(_ number: Int) {
        numberOfSteps += 1
        if numberOfSteps == 8 {
            scoreTitle = "Game is over!"
            scoreMessage = "Your score is \(score).\nDo you want to start again?"
        } else if number == correctAnswer {
            score += 1
            scoreTitle = "Correct!"
            scoreMessage = ""
        } else {
            scoreTitle = "Wrong!"
            let correctCountry = countries[number]
            scoreMessage = "That’s the flag of \(correctCountry).\n"
        }
        showingAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        askQuestion()
        numberOfSteps = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
