//
//  ListView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let people = ["phganh08", "longhoang", "tyemtee"]
    var body: some View {
        List {
            Section(header: Text("Static")) {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Section(header: Text("Dynamic")) {
                ForEach(1...3, id: \.self) {
                    Text("Static: \($0)")
                }
            }
            Section(header: Text("Name")) {
                ForEach(people, id: \.self) {
                    Text("\($0)")
                }
            }
        }
            // space in header (~ + navigationView)
        .listStyle(GroupedListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
