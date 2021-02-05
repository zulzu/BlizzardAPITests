
import SwiftUI

struct CovenantMainView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: CovenantMainViewModel
    var covenantID: Int
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStackWithNavigationBar(zStackAlignment: .top, navBarTitle: viewModel.covenantName, showBackButton: true) {
            
            ZStack {
                
                if viewModel.isCovenantLoaded {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(viewModel.covenantDescription)
                            .foregroundColor(.textColour)
                            .modifier(AnimatedOpacity(delay: 0.3))
                        
                        ThickDivider()
                            .modifier(AnimatedOpacity(delay: 0.3))
                        
                        Text("Signature ability: \(viewModel.abilityName)")
                            .bold()
                            .foregroundColor(.textColour)
                            .modifier(AnimatedOpacity(delay: 0.8))
                        
                        Text(viewModel.abilityDescription)
                            .foregroundColor(.textColour)
                            .modifier(AnimatedOpacity(delay: 1.3))
                        
                        NavigationLink("Class abilities", destination: CovenantClassAbilitiesView(viewModel: CovenantClassAbilitiesViewModel.init(), covenantID: covenantID))
                            .frame(width: 180, height: 50)
                            .background(Color.background03)
                            .cornerRadius(10.0)
                            .accentColor(.textColour)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.background02, lineWidth: 4)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gold, lineWidth: 2)
                            )
                            .modifier(AnimatedOpacity(delay: 1.8))
                            .padding(.top)
                        
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.getCovenant(id: covenantID)
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
struct CovenantMainView_Previews: PreviewProvider {
    static var previews: some View {
        CovenantMainView(viewModel: CovenantMainViewModel.init(), covenantID: 1)
    }
}
