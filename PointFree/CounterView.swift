import SwiftUI
import Combine

struct CounterView: View {
    //    @ObservedObject var state: AppState
    @ObservedObject var store: Store<AppState, AppAction>
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    //self.store.value.count -= 1
                    
                    //to make it readable -> create a reducer function
                    //self.store.value = counterRuducer(state: self.store.value, action: .decrTapped)}
                    
                    //still verbose, to centralised it in store
                    //self.store.send(.decrTapped)
                    
                    //AppAction Modularity
                    self.store.send(.counter(.decrTapped))
                }
                
                Text("\(self.store.value.count)")
                
                Button("+") {
                    self.store.send(.counter(.incrTapped))
                }
            }
            
            Button("Save to favorite numbers") {
                self.store.value.favoriteNumbers.append(self.store.value.count)
                
            }
            
        }
        .font(.title)
        .navigationBarTitle("Counter")
    }
    
}



