//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Yahia Ewida on 10/14/20.
//  Copyright © 2020 Yahia Ewida. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

struct IptionalImage_Previews: PreviewProvider {
    static var previews: some View {
        OptionalImage()
    }
}
