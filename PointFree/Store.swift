import Combine

//class Store: ObservableObject {
//    var value: AppState
//    init(value: AppState) {
//        self.value = value
//    }
//}

class Store<Value>: ObservableObject {
    @Published var value: Value
    init(value: Value) {
        self.value = value
    }
}
