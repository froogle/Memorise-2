//
//  ContentView.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import SwiftUI

struct ContentView: View {
    let cell = GridItem(.adaptive(minimum: 80))
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [cell]) {
                CardView()
            }.padding()
        }
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .shadow(color: .black, radius: 5, x:0, y:5)
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 3)
            Text("EMOJI")
        }
        .aspectRatio(2/3, contentMode: .fill)
        .foregroundColor(.red)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
