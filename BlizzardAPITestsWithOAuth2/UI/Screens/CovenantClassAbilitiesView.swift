
import SwiftUI

struct CovenantClassAbilitiesView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: CovenantClassAbilitiesViewModel
    var covenantID: Int
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if viewModel.isCovenantLoaded {
                
                ScrollView {
                    
                    ForEach(0..<viewModel.playableClasses.count, id: \.self) { (idx)  in
                        
                        ClassAbilityView(className: viewModel.playableClasses[idx], spellName: viewModel.spellName[idx], spellDescription: viewModel.spellDescription[idx])
                            .modifier(AnimatedOpacity(delay: 0.4 * Double(idx)))
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getCovenant(id: covenantID)
        }
        .navigationBarTitle(viewModel.covenantName + " class abilities", displayMode: .large)
        .padding()
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
struct CovenantClassAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CovenantClassAbilitiesView(viewModel: CovenantClassAbilitiesViewModel.init(), covenantID: 1)
    }
}
