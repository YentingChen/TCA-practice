import SwiftUI

@main
struct TCAApp: App {
 
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store<AppState, AppAction>(value: appState, reducer: self.appRuducer(state:action:)))
        }
    }
    
    func appRuducer(state: inout AppState, action: AppAction) {
        switch action {
        case .counter(.decrTapped):
            state.count -= 1
        case .counter(.incrTapped):
            state.count += 1
        case .fav(.saveFavoriteTapped):
            state.favoriteNumbers.append(state.count)
        case let .fav(.removeFavorite(indexSet)):
            for index in indexSet {
                state.favoriteNumbers.remove(at: index)
            }
        }
    }
}

