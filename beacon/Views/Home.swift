//
//  Home.swift
//  beacon
//
//  Created by Sreehari Nambiar on 27/02/21.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
   
    
    //To update for dark mode
    @Environment(\.colorScheme) var scheme
    
    @Binding var offset : CGFloat
    
    
    var body: some View {
        //Beacon home View....
        
        TabView(selection: $selectedTab){
            
            ChatView(offset:$offset)
                .padding(.top,edges?.top).tag("house.fill")
            Text("Create").tag("plus.rectangle.fill")
            Text("Settings").tag("person.circle.fill")
            
        }
        .overlay(
            //Custom tab bar...
            
            VStack(spacing: 12){
                Divider().padding(.horizontal,-15)
                
                HStack(spacing:0){
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    
                    TabBarButton(image: "plus.rectangle.fill", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person.circle.fill", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal).padding(.bottom,edges?.bottom ?? 15).background(scheme == .dark ? Color.black : Color.white)
            ,alignment: .bottom
        )
        .ignoresSafeArea()
    }
}
//Tab Bar Button...

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab:String
    
    var body: some View{
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image).font(.title).foregroundColor(selectedTab == image ? Color("Blue") : .gray)
        })
    }
    
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//    }
//}
