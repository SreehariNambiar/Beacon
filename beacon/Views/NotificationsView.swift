//
//  NotificationsView.swift
//  beacon
//
//  Created by Sreehari Nambiar on 01/03/21.
//

import SwiftUI

struct NotificationsView: View {
    @Binding var offset : CGFloat
    var body: some View {
        VStack{
            HStack{
               
    
                Button(action: {
                    offset = rect.width
                    
                }
                       
                       
                       , label: {
                    HStack{
                        Image(systemName: "chevron.left").font(.system(size:24,weight: .bold))
                        Text("Home").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                       
                   
                        
                        Spacer()
                      
                    }.foregroundColor(Color.yellow)
                    })
                
            }.padding()
            .overlay(
                Text("Activity").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            )
            
            ScrollView(.vertical, showsIndicators: false, content: {
             
               
                ScrollView(.horizontal, showsIndicators:false,content : {
                  
                })
            })
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
