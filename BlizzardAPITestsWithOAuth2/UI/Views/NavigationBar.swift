
import SwiftUI

struct NavigationBar: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let title: String
    let showBackButton: Bool
    
    // # Private/Fileprivate
    @Environment(\.presentationMode) private var mode: Binding<PresentationMode>
    
    // # Body
    var body: some View {
        
        ZStackWithBackground {
            
            if showBackButton {
                
                HStack {
                    
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.textColour)
                            Text("Back")
                                .foregroundColor(.textColour)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            
            //TODO: If the title is too long, the back button and the title can overlap
            HStack {
                
                Spacer()
                Text(title)
                    .foregroundColor(.textColour)
                Spacer()
            }
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    init(title: String? = nil, showBackButton: Bool = false) {
        self.title = title ?? ""
        self.showBackButton = showBackButton
    }
    
    init(title: String? = nil) {
        self.title = title ?? ""
        self.showBackButton = false
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    
}

//=======================================
// MARK: Previews
//=======================================
struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "temp", showBackButton: true)
    }
}
