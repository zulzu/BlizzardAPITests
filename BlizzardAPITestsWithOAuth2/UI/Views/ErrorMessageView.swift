
import SwiftUI

struct ErrorMessageView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    var errorMessage: String
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        Text(errorMessage)
            .font(.title2)
            .bold()
            .foregroundColor(.gold)
            .multilineTextAlignment(.center)
            .animation(nil)
            .modifier(Blink())
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
struct ErrorMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessageView(errorMessage: "This is an error.")
    }
}
