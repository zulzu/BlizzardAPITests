
import Foundation

//=======================================
// MARK: ViewModel
//=======================================
final class CovenantsViewModel: ObservableObject {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @Published var covenantNames: Array<String> = []
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
extension CovenantsViewModel {
    
    // MARK: Covenant Index API
    func getCovenantIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getCovenantIndex(region: region, locale: locale) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                
                case .success(let covenantIndex):
                    let covenantCount = 1...covenantIndex.covenants.count
                    for number in covenantCount {
                        self.covenantNames.append("\(covenantIndex.covenants[number - 1].name ?? String.getString(.errorMsg))")
                    }
                    self.isCovenantLoaded = true
                    
                case .failure(let error):
                    ErrorHandler().handleError(error)
                }
            }
        }
    }
}
