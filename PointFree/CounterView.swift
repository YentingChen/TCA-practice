import SwiftUI
import Combine

struct CounterView: View {
    @ObservedObject var state: AppState
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.state.count -= 1 }) {
                    Text("-")
                }
                Text("\(self.state.count)")
                Button(action: { self.state.count += 1 }) {
                    Text("+")
                }
            }
            Button(action: {
              self.state.favoriteNumbers.append(self.state.count)

            }) {
              Text("Save to favorite numbers")
            }
            
        }
        .font(.title)
        .navigationBarTitle("Counter")
    }
}
