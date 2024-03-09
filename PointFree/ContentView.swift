import SwiftUI
import Combine

struct ContentView: View {
  @ObservedObject var state: AppState

  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: CounterView(state: self.state)) {
          Text("Counter demo")
        }
        NavigationLink(destination: FavoritePrimesView(state: self.$state.favoritePrimesState)) {
          Text("Favorite primes")
        }
      }
      .navigationBarTitle("State management")
    }
  }
}
