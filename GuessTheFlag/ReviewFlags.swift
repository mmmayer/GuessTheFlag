//
//  ReviewFlags.swift
//  GuessTheFlag
//
//  Created by Michael M. Mayer on 2/22/22.
//
// Inspired by Paul Hudson at [HackingWithSwift.com](https://www.hackingwithswift.com), this started as an exercise that was part of his [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

import SwiftUI

// Displays all the flags in the game along with their country name
struct ReviewFlags: View {
    private var countriesSorted = countries.sorted()
    var body: some View {
        Form {
            GridStack(rows: countries.count / 2, columns: 2) { row, col in
                VStack(spacing: 5) {
                    Image(countriesSorted[row * 2 + col])
                        .renderingMode(.original)
                        .frame(width: 150.0, height: 75.0, alignment: .center)
                        .flagStyle()
                    Text(countriesSorted[row * 2 + col])
                }
            }
        }
    }
}

struct ReviewFlags_Previews: PreviewProvider {
    static var previews: some View {
        ReviewFlags()
    }
}
