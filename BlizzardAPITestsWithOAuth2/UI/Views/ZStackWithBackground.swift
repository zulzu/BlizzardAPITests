

import SwiftUI

struct ZStackWithBackground<Content> : View where Content : View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let alignment: Alignment
    private var content: () -> Content
    
    // # Body
    var body: some View {
        
        ZStack(alignment: alignment) {
            
            Color.background01
                .edgesIgnoringSafeArea(.all)
            
            content()
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public init(alignment: Alignment = .center, @ViewBuilder content: @escaping () -> Content) {
        self.alignment = alignment
        self.content = content
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}

//=======================================
// MARK: Previews
//=======================================
struct ZStackWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        ZStackWithBackground {
            Text("Hello, World!")
                .foregroundColor(.textColour)
        }
    }
}
