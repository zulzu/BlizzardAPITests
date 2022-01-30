
import SwiftUI

struct ClassAbilityView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    var className: String
    var spellName: String
    var spellDescription: String
    var isLast: Bool
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(className)
                .bold()
                .foregroundColor(.gold)
            Text(spellName)
                .foregroundColor(.background03)
            Text(spellDescription)
                .font(.footnote)
                .foregroundColor(.textColour)
            Divider()
                .background(Color.textColour)
                .opacity(isLast ? 0.0 : 1.0)
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
        ClassAbilityView(className: "Death Knight", spellName: "bleh", spellDescription: "signature big spell", isLast: false)
    }
}
