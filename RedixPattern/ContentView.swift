//
//  ContentView.swift
//  RedixPattern
//
//  Created by paige shin on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
    
    let store: AppStore = AppStore(
        initState: AppState.init(currentDice: "🀙"),                 
        reducer: appReducer(_:_:))
    
    var body: some View {
        DiceView()
            .environmentObject(self.store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
