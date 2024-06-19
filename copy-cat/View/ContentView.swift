//
//  ContentView.swift
//  copy-cat
//
//  Created by Kevin Vilca on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var copycatHistory = CopyCatHistory()
    @State private var overText = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Copy Cat 🐱")
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }.padding()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Array(copycatHistory.items.enumerated()), id: \.element) { index, item in
                        ZStack {
                            HoverBackground()
                            HStack(alignment: .center) {
                                Text("\(index + 1)")
                                    .padding().foregroundColor(.gray)
                                Text(item)
                                    .padding()
                                    .lineLimit(4)
                                Spacer()
                                Button(action: {
                                    deleteItem(at: index)
                                }) {
                                    Image(systemName: "trash.fill")
                                        .padding()
                                        .foregroundColor(.gray)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        .onHover { over in
                            overText = over
                        }
                        .onTapGesture {
                            writeToPasteboard(text: item)
                        }
                        Divider()
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func writeToPasteboard(text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(text, forType: .string)
    }
    
    func deleteItem(at index: Int) {
        copycatHistory.items.remove(at: index)
    }
}

struct HoverBackground: View {
    @State private var isHovered = false
    
    var body: some View {
        Color(isHovered ? Color.gray.opacity(0.2) : .clear)
            .onHover { hover in
                isHovered = hover
            }
            .animation(.easeInOut, value: isHovered)
    }
}

#Preview {
    ContentView()
}
