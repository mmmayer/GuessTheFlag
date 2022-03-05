//
//  GridStack.swift
//  GuessTheFlag
//
//  Created by Michael M. Mayer on 2/25/22.
//

import SwiftUI

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
