import SwiftUI
import AppKit

@main
struct swiftaswindApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // We won't use this scene since we build the window manually
        Settings {
            EmptyView()
        }
    }
}

// MARK: - AppDelegate for custom floating window

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()

        window = OverlayWindow(
            contentRect: NSRect(x: 300, y: 300, width: 400, height: 60),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )

        window.isOpaque = true
        window.backgroundColor = .clear
        window.level = .floating
        window.hasShadow = true
        window.isReleasedWhenClosed = false
        window.ignoresMouseEvents = false
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        window.contentView = DraggableHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}

class OverlayWindow: NSWindow {
    override var canBecomeKey: Bool { return true }
    override var canBecomeMain: Bool { return true }
}
