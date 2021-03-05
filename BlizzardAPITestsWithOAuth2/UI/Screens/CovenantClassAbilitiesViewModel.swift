
import Foundation

//=======================================
// MARK: ViewModel
//=======================================
final class CovenantClassAbilitiesViewModel: ObservableObject {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @Published var covenantName: String = ""
    @Published var playableClasses: Array<String> = []
    @Published var spellName: Array<String> = []
    @Published var spellDescription: Array<String> = []
    @Published var errorMessage: String = ""
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
extension CovenantClassAbilitiesViewModel {
    
    // MARK: Covenant API
    func getCovenant(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getCovenant(id: id, region: region, locale: locale) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                
                case .success(let covenant):
                    
                    self.covenantName = covenant.name
                    
                    let classAbilityCount = 1...covenant.class_abilities.count
                    for number in classAbilityCount {
                        self.playableClasses.append("\(covenant.class_abilities[number - 1].playable_class.name)")
                        self.spellName.append("\(covenant.class_abilities[number - 1].spell_tooltip.spell.name)")
                        self.spellDescription.append("\(covenant.class_abilities[number - 1].spell_tooltip.description)")
                    }

                    self.isCovenantLoaded = true

                case .failure(let error):
                    ErrorHandler().handleError(error)
                    self.errorMessage = "\(error.message)"
                }
            }
        }
    }
}
