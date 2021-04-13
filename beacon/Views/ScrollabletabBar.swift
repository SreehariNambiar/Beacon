//
//  ScrollabletabBar.swift
//  beacon
//
//  Created by Sreehari Nambiar on 28/02/21.
//

import SwiftUI

struct ScrollabletabBar<Content: View>: UIViewRepresentable {
   
    
    //to store our Swiftui view...
    var content: Content
    
    //Getting Rect to calculate width abd Height of the ScrollView...
    
    var rect:CGRect
    
    //ContentOffset...
    @Binding var offset: CGFloat
    
    //Tabs...
    var tabs: [Any]
    
    //ScrollView...
    //For Paging AKA Scrollable Tabs...
    let scrollView = UIScrollView()
    
    init(tabs:[Any],rect: CGRect,offset: Binding<CGFloat>,@ViewBuilder content: ()->Content){
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollabletabBar.Coordinator(parent: self)
        
    }
    func makeUIView(context: Context) -> UIScrollView{
        
        setUpScrollView()
        // setting Content Size...
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollView.contentOffset.x = offset
        
        scrollView.addSubview(extractView())
        
        scrollView.delegate = context.coordinator
        
        return scrollView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        //Updating View...
        if uiView.contentOffset.x != offset{
           
//            uiView.contentOffset.x = offset
            //Animating...
            //the animating glitch is because it is uodating on two times...
//            uiView.setContentOffset(CGPoint(x: offset, y: 0),animated: true)
            
            //Simple
            //Removing the delegate while animating...
            uiView.delegate = nil
            
            UIView.animate(withDuration:0.4){
                uiView.contentOffset.x = offset
            } completion: {
                (status) in
                if status{
                    uiView.delegate = context.coordinator
                }
            }
        }
    }
  // setting up ScrollView....
    func setUpScrollView(){
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    //Extracing SwiftUi View
    func extractView()->UIView{
        //since it depends upon tab size...
        //so we getting tabs also...
        
        let controller = UIHostingController(rootView: HStack(spacing: 0){
            content
        }.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    //delegate function to get Offset
    
    class Coordinator: NSObject,UIScrollViewDelegate{
       
        var parent: ScrollabletabBar
        
        init(parent: ScrollabletabBar){
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView){
            
            parent.offset = scrollView.contentOffset.x
        }
    }
}

//struct ScrollabletabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
