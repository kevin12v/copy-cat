//
//  ContentView.swift
//  copy-cat
//
//  Created by Kevin Vilca on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var copycatHistory = CopyCatHistory()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Copy Cat 🐱")
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(copycatHistory.items, id: \.self) { item in
                        ZStack {
                            HoverBackground()
                            Text(item)
                                .padding()
                                .lineLimit(4)
                        }.onTapGesture {
                            writeToPasteboard(text: item)
                        }
                        Divider()
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func writeToPasteboard(text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(text, forType: .string)
    }
}

struct HoverBackground: View {
    @State private var isHovered = false
    
    var body: some View {
        Color(isHovered ? .gray : .clear)
            .onHover { hover in
                isHovered = hover
            }
    }
}

#Preview {
    ContentView()
}
