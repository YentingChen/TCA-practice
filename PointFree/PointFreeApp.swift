import SwiftUI

@main
struct PointFreeApp: App {
    
    var appState = AppState()
    
    func counterReducer(state: inout AppState, action: AppAction) {
        switch action {
        case .counter(.decrTapped):
            state.count -= 1
        case .counter(.incrTapped):
            state.count += 1
        default:
            break
        }
    }
    
    func favReducer(state: inout AppState, action: AppAction) {
        switch action {
        case .fav(.save):
            if !state.favoredNumbers.contains(where:  { $0 == state.count }) {
                state.favoredNumbers.append(state.count)
            }
        case .fav(.remove):
            state.favoredNumbers.removeAll(where: { $0 == state.count })
            
        default:
            break
        }
    }
    
    func favListReducer(state: inout AppState, action: AppAction) {
        switch action {
        case let .fav(.removeFrom(index)):
            for index in index {
                state.favoredNumbers.remove(at: index)
            }
            
        default:
            break
        }
    }
    
    
    func combine<Value, Action>(
        _ reducers: (inout Value, Action) -> Void...
    ) -> (inout Value, Action) -> Void {
        return { (value, action) in
            for reducer in reducers {
                reducer(&value, action)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(value: appState, reducer: combine(counterReducer(state:action:), favReducer(state:action:), favListReducer(state:action:))))
        }
    }
}

