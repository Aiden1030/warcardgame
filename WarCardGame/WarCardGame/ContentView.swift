//
//  ContentView.swift
//  WarCardGame
//
//  Created by Aiden Hyun on 2023-02-24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = ""
    @State var cpuCard = ""
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View{
        ZStack{
            
            
            
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .frame(width: 110,height: 200)
                    Spacer()
                    
                    
                    Image(cpuCard)
                        .resizable()
                        .frame(width: 110,height: 200)
                    
                    Spacer()
                }
                Spacer()
                Button{
                    deal()
                    
                }label: {
                    Image("button")
                }
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
                
                Button{
                    cpuScore = 0
                    playerScore = 0
                }label: {
                    Text("reset score")
                        .foregroundColor(.white)
                }            }
        }
    }
    
    
    func randomNewCard()->(String, Int, Int){
        
        let shapeList = ["_of_clubs","_of_hearts","_of_diamonds","_of_spades"]
        let numberList = ["ace","2","3","4","5","6","7","8","9","10","jack","king","queen"]
        
        let randomNumShape = Int.random(in: 0...3)
        let randomNumNum = Int.random(in: 0...12)
        
        return (numberList[randomNumNum]+shapeList[randomNumShape],randomNumShape,randomNumNum)
    }
    
    
    
    func deal(){
        var playerNumShape=0
        var playerNumNum=0
        var cpuNumShape=0
        var cpuNumNum=0
        
        (playerCard,playerNumShape,playerNumNum) = randomNewCard()
        (cpuCard, cpuNumShape,cpuNumNum) = randomNewCard()
        
        var playerPoint = playerNumNum + playerNumShape
        var cpuPoint = cpuNumNum + cpuNumShape
        
        if(playerPoint>cpuPoint){
            playerScore+=1
        }else if(cpuPoint > playerPoint){
            cpuScore+=1
        }else{
            cpuScore+=1
            playerScore+=1
        }
        
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

