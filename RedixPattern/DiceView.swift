//
//  DiceView.swift
//  RedixPattern
//
//  Created by paige shin on 2022/11/09.
//

import SwiftUI

struct DiceView: View {
    
    @EnvironmentObject private var store: AppStore
    
    @State private var shouldRoll = false
    @State private var pressed = false
    
    var diceRollAnimation: Animation {
        Animation.spring()
    }
    
    func rollTheDice() {
        print(#fileID, #function, #line)
        self.shouldRoll.toggle()
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color.init(.purple))
                .rotationEffect(.degrees(self.shouldRoll ? 360 : 0))
                .animation(self.diceRollAnimation, value: self.shouldRoll)
            
            Button {
                self.rollTheDice()
            } label: {
                Text("RANDOM DICE")
                    .fontWeight(.black)
            }
            .buttonStyle(MyButtonStyle())
            .scaleEffect(self.pressed ? 0.8 : 1.0)
            .onLongPressGesture(
                minimumDuration: .infinity,
                maximumDistance: .infinity,
                pressing: { pressing in
                    withAnimation(.easeOut(duration: 0.2), {
                        self.pressed = pressing
                    })
                },
                perform: {}
            )

        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
