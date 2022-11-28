import Cocoa
import AppKit
import Then

class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow!
    
    private var statusItem: NSStatusItem!
    
    private let menu = NSMenu().then{
        $0.title = ""
    }
    
    private let openMenuItem = NSMenuItem().then{
        $0.title = "열기"
        $0.tag = 1
        $0.action = #selector(openMenuItemDidTap)
    }
    
    private let exitMenuItem = NSMenuItem().then{
        $0.title = "종료"
        $0.tag = 4
        $0.action = #selector(quitMenuItemDidTap)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button{
            statusButton.image = NSImage(systemSymbolName: "message.fill", accessibilityDescription: "message")
        }
        statusItem.menu = menu
        
        [openMenuItem, .separator(), exitMenuItem].forEach(menu.addItem(_:))
        
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 270),
                          styleMask: [.miniaturizable, .closable, .resizable, .titled],
                          backing: .buffered,
                          defer: false)
        window.center()
        window.minSize = NSSize(width: 800, height: 610)
        window.contentViewController = MainVC()
        window.makeKeyAndOrderFront(nil)
        window?.titlebarAppearsTransparent = true
    }
    
    @objc func openMenuItemDidTap(){
        NSApp.activate(ignoringOtherApps: true)
    }
    
    @objc func quitMenuItemDidTap(){
        NSApplication.shared.terminate(false)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
