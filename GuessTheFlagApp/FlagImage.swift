//
//  FlagImage.swift
//  GuessTheFlagApp
//
//  Created by Ангелина Шаманова on 20.11.22..
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(
                Rectangle())
            .shadow(radius: 5)
    }
}
