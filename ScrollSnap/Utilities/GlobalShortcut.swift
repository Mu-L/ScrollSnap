//
//  GlobalShortcut.swift
//  ScrollSnap
//

import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let invokeScrollSnap = Self(
        "invokeScrollSnap",
        initial: .init(.s, modifiers: [.control, .option])
    )
}
