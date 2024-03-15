import Combine
import Foundation

//class AppState: ObservableObject {
//    @Published var count = 0
//    @Published var favoriteNumbers: [Int] = []
//}

struct AppState {
    var count = 0
    var favoriteNumbers: [Int] = []
}

//enum AppAction {
//    case decrTapped
//    case incrTapped
//    case saveFavoriteTapped
//    case removeFavorite(indexSet: IndexSet)
//}

enum AppAction {
    case counter(CounterAction)
    case fav(FavAction)
}

enum CounterAction {
    case decrTapped
    case incrTapped
}

enum FavAction {
    case saveFavoriteTapped
    case removeFavorite(indexSet: IndexSet)
}
