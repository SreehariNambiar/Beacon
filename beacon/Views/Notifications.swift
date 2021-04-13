//
//  Notifications.swift
//  beacon
//
//  Created by Sreehari Nambiar on 01/03/21.
//

import SwiftUI

struct Notifications: View {
    @Binding var offset : CGFloat
    @State var selectedTab = "bell.fill"
    
   
    
    //To update for dark mode
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ZStack{
            Color.blue
            
            TabView(selection: $selectedTab){
                
                NotificationsView(offset : $offset)
                    .padding(.top,edges?.top).tag("bell.fill")
                
                
                
            }
            .overlay(
                //Custom tab bar...
                
                VStack(spacing: 12){
                    Divider().padding(.horizontal,-15)
                    
                    HStack(spacing:0){  
                        
                        rocc(image: "bell.fill", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                        
                      
                    }
                }
                .padding(.horizontal).padding(.bottom,edges?.bottom ?? 15).background(scheme == .dark ? Color.black : Color.white)
                ,alignment: .bottom
            )
            .ignoresSafeArea()
       
        VStack{
            
        }.padding(.top,edges?.top ?? 15)
        .padding(.bottom,edges?.bottom)
    }
    }
}

struct rocc: View{
    var image: String
    @Binding var selectedTab:String
    var body: some View{
        Button(action: {
            selectedTab = image
        }, label: {
            Image( systemName:image).resizable().aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30).background(Circle()
                                                            .fill(selectedTab == image ? Color.yellow : .gray)
                                                            .frame(width: 60, height: 60)).foregroundColor(selectedTab == image ? Color.black : .gray)
        })
    }
}
struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
