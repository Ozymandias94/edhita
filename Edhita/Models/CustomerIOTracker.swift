import CioDataPipelines
import Foundation

/// Customer.io Data In (CDP source) tracking. Does nothing unless a write key is configured.
enum CustomerIOTracker {
    static let writeKeyInfoKey = "CIOCDPWriteKey"
    static let anonymousIDDefaultsKey = "customerIOAnonymousUserID"
    static let debugUserID = "edhita-demo-user"

    private static var isEnabled = false

    /// Returns the key from Info.plist values, or nil when it is missing, empty or an unexpanded `$(...)`.
    static func writeKey(from info: [String: Any]?) -> String? {
        guard let key = (info?[writeKeyInfoKey] as? String)?.trimmingCharacters(in: .whitespaces),
            !key.isEmpty, !key.hasPrefix("$(")
        else { return nil }
        return key
    }

    /// Debug builds use a fixed, easy-to-spot ID; release builds use a random per-install ID.
    static func userID(defaults: UserDefaults = .standard, isDebug: Bool) -> String {
        if isDebug { return debugUserID }
        if let id = defaults.string(forKey: anonymousIDDefaultsKey) { return id }
        let id = UUID().uuidString
        defaults.set(id, forKey: anonymousIDDefaultsKey)
        return id
    }

    /// Call once at launch.
    static func start() {
        guard let key = writeKey(from: Bundle.main.infoDictionary) else { return }

        #if DEBUG
            let isDebug = true
            let builder = SDKConfigBuilder(cdpApiKey: key)
                .region(Region.EU)
                .logLevel(.debug)
                .flushAt(1)
        #else
            let isDebug = false
            let builder = SDKConfigBuilder(cdpApiKey: key).region(Region.EU)
        #endif

        CustomerIO.initialize(withConfig: builder.build())
        isEnabled = true
        CustomerIO.shared.identify(userId: userID(isDebug: isDebug))
    }

    static func track(_ name: String, properties: [String: Any] = [:]) {
        guard isEnabled else { return }
        CustomerIO.shared.track(name: name, properties: properties)
    }

    static func screen(_ title: String) {
        guard isEnabled else { return }
        CustomerIO.shared.screen(title: title)
    }
}
