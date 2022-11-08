# SwiftUI_REDUX_ENUM_ACTIONS

### AppState

```swift
import Foundation

// App State, Data 
struct AppState {
    var currentDice: String = ""
}
```

### AppAction

```swift
import Foundation

// Change App State 
enum AppAction: String {
    case rollTheDice
    
}
```

### Reducer 

```swift
import Foundation

// typealiase
typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(_ state: inout AppState, _ action: AppAction) {
    
    switch action {
    case .rollTheDice:
        state.currentDice = ["🀙", "🀚", "🀛", "🀜", "🀝", "🀞"].randomElement() ?? "🀙"
    }
    
}


```

### AppStore 

```swift
import Foundation

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(initState: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initState
        self.reducer = reducer
    }
    
    // dispatch for actions
    func dispatch(action: Action) {
        self.reducer(&self.state, action)
    }
    
}

```
