//
//  copy_catApp.swift
//  copy-cat
//
//  Created by Kevin Vilca on 16/06/24.
//

import SwiftUI

@main
struct copy_catApp: App {
@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.minSize = NSSize(width: 500, height: 500)
            window.maxSize = NSSize(width: 500, height: 500)
        }
    }
}
