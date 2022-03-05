//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michael M. Mayer on 8/26/21.
//
// Inspired by Paul Hudson at [HackingWithSwift.com](https://www.hackingwithswift.com), this started as an exercise that was part of his [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

import SwiftUI

// A list of countries that have flag assets in the app
var countries = ["China", "Iceland", "Mali", "Spain", "Algeria", "Columbia", "Indonesia", "Mauritius", "Sudan", "Ireland", "Switzerland", "Armenia", "Cuba", "Israel", "Morocco", "Syria", "Australia", "Denmark", "Italy", "Nigeria", "Thailand", "Austria", "Estonia", "Jamaica", "Norway", "Turkey", "Bangladesh", "Finland", "Japan", "Poland", "UK", "Belgium", "Kuwait", "Republic of the Congo", "US", "Bolivia", "France", "Laos", "Romania", "Ukraine", "Botswana", "Germany", "Latvia", "Russia", "Vietnam", "Bulgaria", "Greece", "Liberia", "Sierra Leone", "Yemen", "Canada", "Guinea", "Lithuania", "Singapore", "Guyana", "Somalia", "Chile", "Hungary", "Madagascar", "South Africa"].shuffled()

// A modifier for flag umages
struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.renderingMode(.original)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8,height: 8)))
            .overlay(RoundedRectangle(cornerSize: CGSize(width: 8,height: 8)).stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 6)
    }
}

extension View {
    func flagStyle() -> some View {
        self.modifier(FlagImage())
    }
}

struct ContentView: View {
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var questionCount = 0
    @State private var isScoreShowing = false
    
    @State private var score = 0
    @State private var countrySelected = ""
        
    var body: some View {
        NavigationView {
            ZStack {
                AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), center: .center)
                    .ignoresSafeArea(.all)
                VStack(spacing: 30) {
                    VStack(spacing: 1) {
                        Text("Tap the flag of")
                            .font(.title2.weight(.semibold))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.black))
                    }
                    .foregroundColor(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(num: number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .flagStyle()
                        }
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        HStack(spacing: 20) {
                            Text("Score:")
                            Text("\(score)")
                                .fontWeight(.black)
                            Text("(out of \(questionCount))")
                                .font(.headline)
                        }
                        .font(.largeTitle)
                        Button("New Game", role: .destructive) {
                            reset()
                        }
                    }
                    Spacer()
                    NavigationLink(destination: ReviewFlags()) {
                        Text("Review Flags")
                    }
                    Spacer()
                }
            }
            .alert(isPresented: $isScoreShowing) {
                Alert(title: Text("Incorrect"), message: Text("You chose the flag for \(countrySelected)"), dismissButton: .default(Text("Continue")) {
                })
            }
        }
    }
    
    // These are the actions taken when a flag is tapped.
    // A new score is calculated and we set up for the next round
    func flagTapped(num: Int) {
        questionCount += 1
        if num == correctAnswer {
            score += 1
        }
        else {
            isScoreShowing = true
            countrySelected = countries[num]
        }
        newQuestion()
    }
    
    // Sets up the new round
    func newQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    // Starts a new round in a new game by shuffling and resetting values
    func reset() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
