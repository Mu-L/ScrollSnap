//
//  WhatsNewContent.swift
//  ScrollSnap
//

import SwiftUI

struct WhatsNewHighlight: Identifiable {
    let id: String
    let symbolName: String
    let color: Color
    let titleKey: String
    let titleFallback: String
    let messageKey: String
    let messageFallback: String

    var title: String {
        LocalizationResolver.string(titleKey, fallback: titleFallback)
    }

    var message: String {
        LocalizationResolver.string(messageKey, fallback: messageFallback)
    }
}

enum WhatsNewContent {
    static let currentHighlights: [WhatsNewHighlight] = [
        WhatsNewHighlight(
            id: "global-shortcut",
            symbolName: "keyboard",
            color: .purple,
            titleKey: "whatsNew.highlight.globalShortcut.title",
            titleFallback: "Global Keyboard Shortcut (⌃⌥S)",
            messageKey: "whatsNew.highlight.globalShortcut.message",
            messageFallback: "Press ⌃⌥S from any app to show ScrollSnap. Customize, reset, or disable the shortcut in Settings."
        ),
        WhatsNewHighlight(
            id: "korean-language",
            symbolName: "globe",
            color: .blue,
            titleKey: "whatsNew.highlight.koreanLanguage.title",
            titleFallback: "Korean Language Support",
            messageKey: "whatsNew.highlight.koreanLanguage.message",
            messageFallback: "ScrollSnap is now fully available in Korean."
        ),
        WhatsNewHighlight(
            id: "background-access",
            symbolName: "clock.arrow.circlepath",
            color: .orange,
            titleKey: "whatsNew.highlight.backgroundAccess.title",
            titleFallback: "Ready in the Background",
            messageKey: "whatsNew.highlight.backgroundAccess.message",
            messageFallback: "Dismissing the capture overlay now keeps ScrollSnap running. You can also launch it automatically when you log in, or open Settings and quit from the Options menu."
        ),
        WhatsNewHighlight(
            id: "capture-reliability",
            symbolName: "checkmark.seal",
            color: .green,
            titleKey: "whatsNew.highlight.captureReliability.title",
            titleFallback: "More Reliable Scrolling Captures",
            messageKey: "whatsNew.highlight.captureReliability.message",
            messageFallback: "Scrolling captures now include the final frame and use improved motion detection and stitching, preventing long screenshots from ending early."
        )
    ]
}
