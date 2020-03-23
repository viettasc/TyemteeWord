//
//  TextView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct TextView: View {
    
    @State private var used = [String]()
    @State private var root = ""
    @State private var new = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $new, onCommit: add)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(used, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(root)
        }
    }
    
    func add() {
        let answer = new.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        used.insert(answer, at: 0)
        new = ""
    }
    
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
