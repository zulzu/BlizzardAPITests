
import SwiftUI

struct ClassAbilityView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    var className: String
    var spellName: String
    var spellDescription: String
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(className)
                .bold()
            Text(spellName)
            Text(spellDescription)
            Divider()
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
struct ClassAbilityView_Previews: PreviewProvider {
    static var previews: some View {
        ClassAbilityView(className: "Death Knight", spellName: "bleh", spellDescription: "signature big spell")
    }
}
