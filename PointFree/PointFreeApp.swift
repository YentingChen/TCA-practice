import SwiftUI

@main
struct TCAApp: App {
    let appState = AppState()
    let appStateStore: Store<AppState>

    init() {
        appStateStore = Store<AppState>(value: appState)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(store: appStateStore)
        }
    }
}

