import SwiftUI
import Combine

struct FavoriteNumbersView: View {
    var store: Store<AppState>
    
    var body: some View {
        List {
            ForEach(self.store.value.favoriteNumbers, id: \.self) { fav in
                Text("\(fav)")
            }
            .onDelete { indexSet in
                for index in indexSet {
                    self.store.value.favoriteNumbers.remove(at: index)
                }
            }
        }
        .navigationBarTitle(Text("Favorite"))
    }
}
