//
//  ContentView.swift
//  WordScramble
//
//  Created by Viettasc Doan on 3/23/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var used = [String]()
    @State private var root = ""
    @State private var new = ""
    
    @State private var title = ""
    @State private var message = ""
    @State private var show = false
    
    @State private var score = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Retype if this word is correct")) {
                    Text(root)
                        .font(.largeTitle)
                        .bold()
                }
                Section(header: Text("Photo")) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        Image("tyemtee")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding()
                    }
                    .frame(height: 231)
                }
                Section(header: Text("Answer:")) {
                    TextField("Enter your word", text: $new, onCommit: add)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                }
                Section(header: Text("Used:")) {
                    List(used, id: \.self) {
                        Image(systemName: "\($0.count).circle")
                        Text($0)
                    }
                }
                Section(header: Text("Score:")) {
                    Text(2 > score ? "\(score) point" : "\(score) points")
                }
            }
            .onAppear(perform: start)
            .alert(isPresented: $show) {
                Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok")))
            }
            .navigationBarItems(leading:
                Button("Start") {
                    self.start()
                }
            )
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
    
    func add() {
        let answer = new.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        score -= 1
        guard answer.count > 0 else {return}
        print("root: ", root)
        if !(root.lowercased() == "tyemtee") {
            guard original(word: answer) else {
                unexpected(title: "Word used already", message: "Be more original")
                return
            }
            guard possible(word: answer) else {
                unexpected(title: "Word not recognized", message: "You can't just make them up")
                return
            }
            guard real(word: answer) else {
                unexpected(title: "Word not possible", message: "That isn't a real word")
                return
            }
        }
        used.insert(answer, at: 0)
        new = ""
        score += 2
        start()
    }
    
    func start() {
        if let url = Bundle.main.url(forResource: "Text", withExtension: "txt") {
            if let words = try? String(contentsOf: url) {
                let all = words.components(separatedBy: "\n")
                print("all: ", all)
                root = all.randomElement() ?? "silkworm"
                if root == "" {
                    root = "pink"
                }
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func original(word: String) -> Bool {
        !used.contains(word)
    }
    
    func possible(word: String) -> Bool {
        var temp = root.lowercased()
        for letter in word {
            if let index = temp.firstIndex(of: letter) {
                temp.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
    
    func real(word: String) -> Bool {
        if 3 >= word.count {
            print("!greater than three")
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func unexpected(title: String, message: String) {
        self.title = title
        self.message = message
        show = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
