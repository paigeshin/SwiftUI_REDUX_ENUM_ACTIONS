//
//  Reducer.swift
//  RedixPattern
//
//  Created by paige shin on 2022/11/09.
//

import Foundation

// typealiase
typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(_ state: inout AppState, _ action: AppAction) {
    
    switch action {
    case .rollTheDice:
        state.currentDice = ["🀙", "🀚", "🀛", "🀜", "🀝", "🀞"].randomElement() ?? "🀙"
    }
    
}

