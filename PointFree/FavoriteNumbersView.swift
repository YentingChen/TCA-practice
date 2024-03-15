import SwiftUI
import Combine

struct FavoriteNumbersView: View {
    var store: Store<AppState, AppAction>
    
    var body: some View {
        List {
            ForEach(self.store.value.favoriteNumbers, id: \.self) { fav in
                Text("\(fav)")
            }
            .onDelete { indexSet in
                self.store.send(.fav(.removeFavorite(indexSet: indexSet)))
            }
        }
        .navigationBarTitle(Text("Favorite"))
    }
}
