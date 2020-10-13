//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Yahia Ewida on 10/12/20.
//  Copyright © 2020 Yahia Ewida. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document : EmojiArtDocument
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) },id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: self.fontSize))
                    }
                }
            }.padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal,.bottom])
        }
    }
    
    //MARK:- Constants
    private let fontSize:CGFloat = 40
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
