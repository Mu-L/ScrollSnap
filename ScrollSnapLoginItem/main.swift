//
//  main.swift
//  ScrollSnapLoginItem
//

import AppKit

guard let helperBundleIdentifier = Bundle.main.bundleIdentifier else {
    exit(EXIT_FAILURE)
}

let mainBundleIdentifier = String(helperBundleIdentifier.dropLast(".LoginItem".count))
guard NSRunningApplication.runningApplications(withBundleIdentifier: mainBundleIdentifier).isEmpty else {
    exit(EXIT_SUCCESS)
}

let mainAppURL = Bundle.main.bundleURL
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()

let configuration = NSWorkspace.OpenConfiguration()
configuration.arguments = ["--launch-at-login"]
configuration.activates = false
configuration.addsToRecentItems = false
configuration.allowsRunningApplicationSubstitution = false

// Sandboxed callers cannot pass arguments through NSWorkspace, so the URL carries
// the same launch intent while keeping the requested argument for other contexts.
let loginLaunchURL = URL(string: "com.berkergungor.scrollsnap.login://launch-at-login")!
NSWorkspace.shared.open(
    [loginLaunchURL],
    withApplicationAt: mainAppURL,
    configuration: configuration
) { application, error in
    if let error {
        NSLog("Unable to launch ScrollSnap: \(error.localizedDescription)")
        exit(EXIT_FAILURE)
    }

    guard application != nil else {
        exit(EXIT_FAILURE)
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        exit(EXIT_SUCCESS)
    }
}

RunLoop.main.run()
