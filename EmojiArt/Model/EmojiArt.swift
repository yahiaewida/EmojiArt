//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Yahia Ewida on 10/13/20.
//  Copyright © 2020 Yahia Ewida. All rights reserved.
//

import Foundation

//Model
struct EmojiArt: Codable {
    var backgroundURL: URL?
    var emojis = [Emoji]()
    
    init? (json: Data?) {
        if json != nil, let newEmojiArt = try? JSONDecoder().decode(EmojiArt.self, from: json!) {
            self = newEmojiArt
        } else {
            return nil
        }
    }
    init() {
        
    }
    struct Emoji: Identifiable, Codable {
        let text: String
        //(0,0) of the doucment is the center not in the top left
        var x: Int
        var y: Int
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id:Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, x:Int, y:Int, size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: x, y: y, size: size, id: uniqueEmojiId))
    }
}
