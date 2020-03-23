//
//  TrimView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct TrimView: View {
    var body: some View {
        let input = """
                    a
                    b
                    c
                    """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trim = letter?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return Text("\(trim)")
    }
}

struct TrimView_Previews: PreviewProvider {
    static var previews: some View {
        TrimView()
    }
}
