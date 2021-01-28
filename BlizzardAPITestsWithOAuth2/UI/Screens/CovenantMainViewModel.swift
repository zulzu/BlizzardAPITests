
import Foundation
import SwiftUI


//=======================================
// MARK: ViewModel
//=======================================
final class CovenantMainViewModel: ObservableObject {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @Published var covenantName: String = ""
    @Published var covenantDescription: String = ""
    @Published var abilityName: String = ""
    @Published var abilityDescription: String = ""

    @Published var isCovenantLoaded = false
    
    // # Private/Fileprivate
    private let wowMC = WorldOfWarcraftModelController.shared
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//------------------------------------
// MARK: Retrieving data
//------------------------------------
extension CovenantMainViewModel {
    
    // MARK: Covenant API
    func getCovenant(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getCovenant(id: id, region: region, locale: locale) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                
                case .success(let covenant):
                    self.covenantName = covenant.name
                    self.covenantDescription = covenant.description
                    self.abilityName = covenant.signature_ability.spell_tooltip.spell.name
                    self.abilityDescription = covenant.signature_ability.spell_tooltip.description
                    self.isCovenantLoaded = true

                case .failure(let error):
                    ErrorHandler().handleError(error)
                }
            }
        }
    }
}
