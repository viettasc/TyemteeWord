//
//  BundleView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct BundleView: View {
    var body: some View {
        if let url = Bundle.main.url(forResource: "Text", withExtension: "txt") {
            if let content = try? String(contentsOf: url) {
                // load string
                return Text(content)
                    .foregroundColor(Color.pink.opacity(0.6))
                    .font(.largeTitle)
            }
        }
        return Text("")
    }
}

struct BundleView_Previews: PreviewProvider {
    static var previews: some View {
        BundleView()
    }
}
