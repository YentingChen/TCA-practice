import Combine

//class Store: ObservableObject {
//    var value: AppState
//    init(value: AppState) {
//        self.value = value
//    }
//}

//class Store<Value>: ObservableObject {
//    @Published var value: Value
//    init(value: Value) {
//        self.value = value
//    }
//}

//class Store<Value, Action>: ObservableObject {
//
//    @Published var value: Value
//    let reducer: (Value, Action) -> Value
//
//    init(value: Value, reducer: @escaping (Value, Action) -> Value) {
//        self.value = value
//        self.reducer = reducer
//    }
//
//    func send(_ action: Action) {
//        self.value = reducer(self.value, action)
//    }
//}

class Store<Value, Action>: ObservableObject {
    
    @Published var value: Value
    let reducer: (inout Value, Action) -> Void
    
    init(value: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = value
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&self.value, action)
    }
}
