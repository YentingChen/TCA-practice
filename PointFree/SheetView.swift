import SwiftUI
import Combine

struct SheetView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        VStack {
            Text("count: \(store.value.count)")
            Text("favoured: \(store.value.favoredNumbers.description)")
        }
    }
}
