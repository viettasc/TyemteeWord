//
//  SpellView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct SpellView: View {
    var body: some View {
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        return Text("\(String(describing: allGood))")
    }
}

struct SpellView_Previews: PreviewProvider {
    static var previews: some View {
        SpellView()
    }
}
