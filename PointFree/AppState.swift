import Combine
import Foundation

class AppState: ObservableObject {
    @Published var count = 0
    @Published var favoritePrimes: [Int] = []
    @Published var loggedInUser: User? = nil
    @Published var activityFeed: [Activity] = []
    
    struct Activity {
        let timestamp: Date
        let type: ActivityType
        
        enum ActivityType {
            case addedFavoritePrime(Int)
            case removedFavoritePrime(Int)
        }
    }
    
    struct User {
        let id: Int
        let name: String
        let bio: String
    }
}

struct FavoritePrimesState {
    var favoritePrimes: [Int]
    var activityFeed: [AppState.Activity]
}

extension AppState {
    var favoritePrimesState: FavoritePrimesState {
        get {
            FavoritePrimesState(
                favoritePrimes: self.favoritePrimes,
                activityFeed: self.activityFeed
            )
        }
        set {
            self.favoritePrimes = newValue.favoritePrimes
            self.activityFeed = newValue.activityFeed
        }
    }
}
