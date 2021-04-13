//
//  MainView.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct MainView: View {
    
    @State var offset: CGFloat = rect.width * 1
    var body: some View {
       //Scrollable Tabs....
        
       
        GeometryReader{reader in
            
            let frame = reader.frame(in: .global)
            //Since there are three views...
            ScrollabletabBar(tabs:["","",""], rect:frame, offset:$offset){
                
                Explore(offset : $offset)
                
                Home(offset : $offset)
                
                Notifications(offset: $offset)
            }
            .ignoresSafeArea()
            
            
        }.ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
