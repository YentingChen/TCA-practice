import Combine
import Foundation

final class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void
    @Published var value: Value
    
    init(value: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = value
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        self.reducer(&self.value, action)
    }
}

struct AppState {
    var count = 0
    var favoredNumbers = [Int]()
}

enum CounterAction {
    case decrTapped
    case incrTapped
}

enum FavAction {
    case remove
    case save
    case removeFrom(IndexSet)
}

enum AppAction {
    case counter(CounterAction)
    case fav(FavAction)
}