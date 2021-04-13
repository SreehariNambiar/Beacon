//
//  ChatView.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct ChatView: View {
    @State var searchText = ""
    @Binding var offset : CGFloat
    @State var selected = 0
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    offset = rect.width * 0
                }
                       , label: {
                    Image("rocket").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30).background(Circle()
                                                                    .fill(Color("Blue"))
                                                                    .frame(width: 45, height: 45))
                })
                Spacer()
                Button(action: {
                    offset = rect.width * 2
                }, label: {
                    Image(systemName: "bell.fill").font(.title)
                        .foregroundColor(.black).background(Circle()
                                                                .fill(Color.yellow)
                                                                .frame(width: 45, height: 45))
                })
                
               
            }.padding()
            .overlay(
                Text("Home").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            )
            
           
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack{
                   
                    HStack{
                        TopBar(selected: $selected)
                    }
                    
                    GeometryReader{_ in
                        
                        VStack{
                            if self.selected == 0{
                                VStack{
                                    SearchBar(text: $searchText)
                                        .padding(.top, 0)
                                    
                                    ScrollView(.horizontal, showsIndicators:false,content : {
                                        HStack(spacing: 15){
                                            Image(systemName: "person.circle.fill").font(.largeTitle).foregroundColor(.primary)
                                                .frame(width: 45, height: 45)
                                        }.padding()
                                        
                                      
                                      
                    //
                    //                         HStack {
                    //
                    //
                    //
                    //                            Image(systemName:"plus.circle.fill").resizable()
                    //                                .aspectRatio(contentMode: .fit)
                    //                                .frame(width:60, height:60)
                    //                                .foregroundColor(Color("Blue"))
                    //                                        .clipShape(Circle())
                    //                                        .shadow(radius: 100)
                    //                                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                    //
                    //                         }
                                        
                                    })
                                }
                             
                                
                            }
                            else{
                                VStack{
                                    SearchBar(text: $searchText)
                                        .padding(.top, 0)
                                    Text("Events")
                                }
                           
                            }
                        }
                        
                    }
                }
              
                
                
          
            })
            
            ZStack(alignment: .bottomTrailing) {
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        FloatingViews()
                            .padding()
                    }
                }.padding(.bottom,50)
               
                        
            }.padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TopBar: View{
    @Binding var selected : Int
    var body: some View {
    Spacer()
    Button(action: {
        self.selected = 0
        
    }){
        Text("All").font(.title3).fontWeight(.semibold).foregroundColor(self.selected == 0 ? Color("Blue") : .gray).padding()
    }
    
    Spacer()
    Button(action: {
        self.selected = 1
        
    }, label: {
        Text("Events").font(.title3).fontWeight(.semibold).foregroundColor(self.selected == 1 ? Color("Blue") : .gray).padding()
    })
    Spacer()
}
}
