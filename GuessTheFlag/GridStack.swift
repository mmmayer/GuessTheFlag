//
//  GridStack.swift
//  GuessTheFlag
//
//  Created by Michael M. Mayer on 2/25/22.
//
// Inspired by Paul Hudson at [HackingWithSwift.com](https://www.hackingwithswift.com), this started as an exercise that was part of his [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

import SwiftUI

// Displays a view which is a grid of other views
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
