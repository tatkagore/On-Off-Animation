//
//  ContentView.swift
//  Shared
//
//  Created by Tatiana Simmer on 16/04/2022.
//

import SwiftUI

struct ContentView: View {

    @State var isLock: Bool = false
        var body: some View {
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red, .purple, .blue]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    Circle()
                            .trim( from: 0, to: 0.5)
                        .stroke(isLock ? Color.blue : Color.purple, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .frame(width: 200, height: 200, alignment: .center)
                        .rotationEffect(.degrees(isLock ? 540 : 180))
                        .animation(Animation.easeInOut(duration: 0.5).repeatCount(1))
                        .onAppear() {
                        self.isLock.toggle()
                        }.offset(x: 0, y: 0)
                }
            
                VStack {
                    Text( isLock  ? "On" : "Off")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(isLock ? .blue : .white)
                         Toggle("", isOn: $isLock)
                        .tint(.blue)
                        .labelsHidden()
                }.padding()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone Xʀ")
    }
}


