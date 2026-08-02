//
//  LoginItemManager.swift
//  ScrollSnap
//

import ServiceManagement

@MainActor
final class LoginItemManager: ObservableObject {
    @Published private(set) var status: SMAppService.Status = .notRegistered
    @Published private(set) var errorMessage: String?

    private var service: SMAppService {
        SMAppService.loginItem(identifier: "\(Bundle.main.bundleIdentifier!).LoginItem")
    }

    var isRegistered: Bool {
        status == .enabled || status == .requiresApproval
    }

    func refresh() {
        status = service.status
    }

    func setRegistered(_ isRegistered: Bool) {
        errorMessage = nil

        do {
            if isRegistered {
                try service.register()
            } else {
                try service.unregister()
            }
        } catch {
            errorMessage = error.localizedDescription
        }

        refresh()
    }

    func openSystemSettings() {
        SMAppService.openSystemSettingsLoginItems()
    }
}
