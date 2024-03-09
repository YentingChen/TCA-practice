import SwiftUI
import Combine

struct ContentView: View {
  @ObservedObject var state: AppState

  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: CounterView(state: self.state)) {
          Text("Counter")
        }
        NavigationLink(destination: FavoriteNumbersView(state: self.state)) {
          Text("Favorite numbers")
        }
      }
      .navigationBarTitle("Home")
    }
  }
}
