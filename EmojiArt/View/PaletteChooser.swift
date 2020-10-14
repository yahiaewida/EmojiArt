//
//  PaletteChooser.swift
//  EmojiArt
//
//  Created by Yahia Ewida on 10/14/20.
//  Copyright © 2020 Yahia Ewida. All rights reserved.
//

import SwiftUI

struct PaletteChooser: View {
    @Binding var chosenPalette: String
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        HStack {
            Stepper(onIncrement: {
                self.chosenPalette = self.document.palette(after: self.chosenPalette)
            }, onDecrement: {
                self.chosenPalette = self.document.palette(before: self.chosenPalette)
            }, label: { EmptyView() })
            Text(self.document.paletteNames[self.chosenPalette] ?? "")
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct PaletteChooser_Previews: PreviewProvider {
    static var previews: some View {
        PaletteChooser(chosenPalette: Binding.constant("Preview"), document: EmojiArtDocument())
    }
}
