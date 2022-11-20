//
//  BlueTitleModifier.swift
//  GuessTheFlagApp
//
//  Created by Ангелина Шаманова on 20.11.22..
//

import SwiftUI

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.semibold))
            .foregroundColor(.indigo)
    }
}
