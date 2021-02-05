
import SwiftUI

struct ThickDivider: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        ZStack {
            
            Divider()
                .frame(height: 4)
                .background(Color.background03)
            Divider()
                .frame(height: 2)
                .background(Color.textColour)
                .opacity(0.6)
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct ThickDivider_Previews: PreviewProvider {
    static var previews: some View {
        ThickDivider()
    }
}
