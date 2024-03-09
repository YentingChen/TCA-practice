import SwiftUI
import Combine

struct ContentView: View {
    //  @ObservedObject var state: AppState
    @ObservedObject var store: Store<AppState>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(store: self.store)) {
                    Text("Counter")
                }
                NavigationLink(destination: FavoriteNumbersView(store: self.store)) {
                    Text("Favorite numbers")
                }
            }
            .navigationBarTitle("Home")
        }
    }
}
