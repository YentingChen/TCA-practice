import SwiftUI
import Combine

struct FavoriteNumbersView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        List {
            ForEach(self.state.favoriteNumbers, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let prime = self.state.favoriteNumbers[index]
                    self.state.favoriteNumbers.remove(at: index)
                }
            }
        }
        .navigationBarTitle(Text("Favorite"))
    }
}
