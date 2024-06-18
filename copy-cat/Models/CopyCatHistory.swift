//
//  CopyCatHistory.swift
//  copy-cat
//
//  Created by Kevin Vilca on 16/06/24.
//

import SwiftUI
import Combine

class CopyCatHistory: ObservableObject {
    @Published var items: [String] = []
    private var timer: AnyCancellable?
    private var pasteboard = NSPasteboard.general
    private var lastChangeCount = NSPasteboard.general.changeCount
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.checkPasteboard()
            }
    }
    
    private func checkPasteboard() {
        if pasteboard.changeCount != lastChangeCount {
            lastChangeCount = pasteboard.changeCount
            if let copiedString = pasteboard.string(forType: .string) {
                addItem(copiedString)
            }
        }
    }
    
    private func addItem(_ item: String) {
        if !items.contains(item) {
            items.insert(item, at: 0)
        }
    }
}

