//
//  AppStore.swift
//  RedixPattern
//
//  Created by paige shin on 2022/11/09.
//

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
