import SwiftUI
import Combine

struct CounterView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    @State var isSheetShown = false
    @State var isAlertShown = false
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    
                    self.store.send(.counter(.decrTapped))
                }
                Text(self.store.value.count.description)
                Button("+") {
                    self.store.send(.counter(.incrTapped))
                }
            }
            
            Button("Save") {
                self.store.send(.fav(.save))

            }
            
            Button("Delete") {

                isAlertShown = store.value.favoredNumbers.count == 0


                
            }
            Button("Show page") {
                isSheetShown = true
            }
        }
        .font(.title)
        .navigationBarTitle("Counter demo")
        .sheet(
            isPresented:
                $isSheetShown,
            onDismiss: {
                isSheetShown = false
            },
            content: {
                SheetView(store: self.store)
            })
        .alert(
            isPresented: $isAlertShown,
            content: {
                Alert(title: Text("hey"))
            })
    }
}
