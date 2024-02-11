import SwiftUI
import Combine

struct FavView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    var body: some View {
        List {
            ForEach(store.value.favoredNumbers, id: \.self) { item in
                Text(item.description)
            }
            .onDelete { index in
                store.send(.fav(.removeFrom(index)))
                
            }
        }
    }
}
