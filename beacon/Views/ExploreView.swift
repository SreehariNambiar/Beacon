//
//  ExploreView.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct ExploreView: View {
    
    @Binding var offset : CGFloat
    
    
    var body: some View {
        
        VStack{
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "camera.fill").font(.title)
                        .foregroundColor(Color("Blue"))
                })
                Spacer()
                Button(action: {
                    offset = rect.width * 1
                }, label: {
                    HStack{
                        Text("Home").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Image(systemName: "chevron.right").font(.system(size:24,weight: .bold))
                   
                        
                        
                      
                    }.foregroundColor(Color("Blue"))
                    })
                
            }.padding()
            .overlay(
                Text("Explore").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            )
            
            ScrollView(.vertical, showsIndicators: false, content: {
             
               
                ScrollView(.horizontal, showsIndicators:false,content : {
                  
                })
            })
        }
    }
}



struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


