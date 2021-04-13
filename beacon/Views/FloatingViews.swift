//
//  FloatingViews.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct FloatingViews: View {
    @State var showMenuItem1 = false
     @State var showMenuItem2 = false
     @State var showMenuItem3 = false
    var body: some View {
        VStack {
          
                    if showMenuItem1 {
                        Button(action: {
                            
                        }, label: {
                            MenuItem(icon: "envelope.fill")
                        })
                       
                    }
                    if showMenuItem2 {
                        
                        Button(action: {
                            
                        }, label: {
                            MenuItem(icon: "person.3.fill")
                        })
                       
                    }
                    if showMenuItem3 {
                        Button(action: {
                            
                        }, label: {
                            MenuItem(icon: "pencil")
                        })
                       
                    }
            
        Button(action: {
            self.showMenu()
        }, label: {
            Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 55)
                        .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        })
       
        }
       
    }
    
    func showMenu() {
            withAnimation {
                showMenuItem3.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                withAnimation {
                    self.showMenuItem2.toggle()
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                withAnimation {
                    self.showMenuItem1.toggle()
                }
            })
        }
}

struct FloatingViews_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        
        
        ZStack {
            Circle()
                .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(systemName:icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }.shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .trailing))
    }
}
