import Combine
import Foundation

class AppState: ObservableObject {
    @Published var count = 0
    @Published var favoriteNumbers: [Int] = []
}
