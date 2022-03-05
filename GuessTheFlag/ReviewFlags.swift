//
//  ReviewFlags.swift
//  GuessTheFlag
//
//  Created by Michael M. Mayer on 2/22/22.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Flags of the World", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

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
            //remove the default Navigation Bar space:
            //.hiddenNavigationBarStyle()
        }
    }
}

struct ReviewFlags_Previews: PreviewProvider {
    static var previews: some View {
        ReviewFlags()
    }
}
