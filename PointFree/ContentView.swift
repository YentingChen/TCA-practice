import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    CounterView(store: store)
                } label: {
                    Text("Calculate Page")
                }
                
                NavigationLink {
                    FavView(store: store)
                } label: {
                    Text("Fav Page")
                }
                
                
            }
        }
    }
}







