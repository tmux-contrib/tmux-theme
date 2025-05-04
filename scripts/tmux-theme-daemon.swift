#!/usr/bin/env swift

import Cocoa

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

func updateTheme() {
    shell(CommandLine.arguments[1])
}

updateTheme()

DistributedNotificationCenter.default.addObserver(
    forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
    object: nil,
    queue: nil
) { _ in
    updateTheme()
}

// Enter cocoa run loop and start listening for notifyd events
NSApplication.shared.run()
