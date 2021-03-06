//
//  ContentView.swift
//  Shared
//
//  Created by A.M. Student on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
        Home()
            .navigationTitle("Tic Tac Toe")
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Home: View {

    @State var moves : [String] = Array(repeating: "", count: 9)
    @State var isPlaying = true
    
    
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                
                ForEach(0..<9, id: \.self) {index in
                    
                    ZStack {
                        Color.blue
                            
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        }
                            .frame(width: getWidth(), height: getWidth())
                            .cornerRadius(15)
                            .rotation3DEffect(
                                .init(degrees: moves[index] != "" ? 180 : 0),
                                axis: (x:0.0, y:1.0, z:0.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                    
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            
                            if moves[index] == ""{
                                moves[index] = isPlaying ? "X" : "O"
                                isPlaying.toggle()
                            }
                            
                            
                            
                        }
                    })
                }
            }
            .padding(15)
        }
    }
    
    func getWidth() -> CGFloat {
       // let width = UIScreen.main.bounds.width - (30 + 30)
        
        let width = UIScreen.main.bounds.width - (30 + 30)
        
        return width / 3
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
