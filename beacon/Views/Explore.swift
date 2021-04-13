//
//  Explore.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct Explore: View {
    
    @State var selectedTab = "rocket"
    @Binding var offset : CGFloat
    
    //To update for dark mode
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
      
        ZStack{
            Color.blue
            
            TabView(selection: $selectedTab){
                
                ExploreView(offset:$offset)
                    .padding(.top,edges?.top).tag("rocket")
                
                Text("Search").tag("magnifyingglass")
                
            }
            .overlay(
                //Custom tab bar...
                
                VStack(spacing: 12){
                    Divider().padding(.horizontal,-15)
                    
                    HStack(spacing:0){
                     
                        
                        
                        roc(image: "rocket", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                        
                        tabBarButton(image: "magnifyingglass", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                        
                      
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

struct roc: View{
    var image: String
    @Binding var selectedTab:String
    var body: some View{
        Button(action: {
            selectedTab = image
        }, label: {
            Image( image).resizable().aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30).background(Circle()
                                                            .fill(selectedTab == image ? Color("Blue") : .gray)
                                                            .frame(width: 45, height: 45)).foregroundColor(selectedTab == image ? Color("Blue") : .gray)
        })
    }
}
struct tabBarButton: View {
    var image: String
    @Binding var selectedTab:String
    
    var body: some View{
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image).font(.largeTitle).foregroundColor(selectedTab == image ? Color("Blue") : .gray)
        })
    }
    
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        MainView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
