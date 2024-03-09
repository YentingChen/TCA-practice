import SwiftUI
import Combine

struct CounterView: View {
//    @ObservedObject var state: AppState
    @ObservedObject var store: Store<AppState>
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.store.value.count -= 1 }) {
                    Text("-")
                }
                Text("\(self.store.value.count)")
                Button(action: { self.store.value.count += 1 }) {
                    Text("+")
                }
            }
            Button(action: {
                self.store.value.favoriteNumbers.append(self.store.value.count)

            }) {
              Text("Save to favorite numbers")
            }
            
        }
        .font(.title)
        .navigationBarTitle("Counter")
    }
}
