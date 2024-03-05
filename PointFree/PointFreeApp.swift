import SwiftUI

@main
struct PointFreeApp: App {
    
    var appState = AppState()
    //favReducer(state:action:)
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(value: appState,
                             reducer: combine(pullback(counterReducer, value: \.count),
                                              pullback(favListReducer, value: \.favoritePrimesState),
                                              favReducer(state:action:))))
        }
    }
    
//    func counterReducer(state: inout AppState, action: AppAction) {
//        switch action {
//        case .counter(.decrTapped):
//            state.count -= 1
//        case .counter(.incrTapped):
//            state.count += 1
//        default:
//            break
//        }
//    }
    
    func counterReducer(state: inout Int, action: AppAction) {
        switch action {
        case .counter(.decrTapped):
            state -= 1
        case .counter(.incrTapped):
            state += 1
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
    
    func favListReducer(state: inout FavoritePrimesState, action: AppAction) {
        switch action {
        case let .fav(.removeFrom(index)):
            for index in index {
                state.favoritePrimes.remove(at: index)
            }
            
        default:
            break
        }
    }
    
//    func combine<Value, Action>(_ first: @escaping (inout Value, Action) -> Void, _ second: @escaping (inout Value, Action) -> Void) -> (inout Value, Action) -> Void {
//        return { (value, action) in
//            first(&value, action)
//            second(&value, action)
//        }
//    }

    func combine<Value, Action>(
        _ reducers: (inout Value, Action) -> Void...
    ) -> (inout Value, Action) -> Void {
        return { (value, action) in
            for reducer in reducers {
                reducer(&value, action)
            }
        }
    }
    
//    func pullback<LocalValue, GlobalValue, Action>(
//        _ reducer: @escaping (inout LocalValue, Action) -> Void,
//        get: @escaping (GlobalValue) -> LocalValue,
//        set: @escaping (inout GlobalValue, LocalValue) -> Void
//    ) -> (inout GlobalValue, Action) -> Void {
//        return { (globalValue, action) in
//            var localValue = get(globalValue)
//            reducer(&localValue, action)
//            set(&globalValue, localValue)
//        }
//    }
    
    func pullback<LocalValue, GlobalValue, Action>(
        _ reducer: @escaping (inout LocalValue, Action) -> Void,
        value: WritableKeyPath<GlobalValue, LocalValue>
    ) -> (inout GlobalValue, Action) -> Void {
        return { (globalValue, action) in
            reducer(&globalValue[keyPath: value], action)
        }
    }
}

