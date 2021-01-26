
import SwiftUI

struct HomeView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let authMC = AuthenticationModelController.shared
    
    let wowMC = WorldOfWarcraftModelController.shared
    
    let authManager = AuthenticationManager()
    
    @State var mythicKeystoneAbilityNumber: String = "The number of the mythic keystone abilities:"

    @State var firstMythicKeytoneAbility: String = "What is the first mythic keystone ability?"
    
    @State var abilityDescription: String = ""
        
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        Text("Hello, World of Warcraft!")
            .font(.headline)
            .fontWeight(.bold)
        
        Button(mythicKeystoneAbilityNumber) {
            getMythicKeystoneAffixes()
        }
        .frame(width: 220, height: 80, alignment: .center)
        .background(Color.blue)
        .cornerRadius(10.0)
        .accentColor(.black)
        .padding()
        
        Button(firstMythicKeytoneAbility) {
            getMythicKeystoneAffix(id: 1)            
        }
        .frame(width: 220, height: 80, alignment: .center)
        .background(Color.blue)
        .cornerRadius(10.0)
        .accentColor(.black)
        .padding()
        
        Text(abilityDescription)
            .padding()

    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    func handleError(_ error: HTTPError, function: String = #function) {
        Debug.print(error.message, function: function)
    }
    
    // MARK: Mythic Keystone Affix API
    func getMythicKeystoneAffixes(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneAffixes(region: region, locale: locale) { result in
            switch result {
            case .success(let mythicKeystoneAffixes):
                Debug.print("Retrieved \(mythicKeystoneAffixes.affixes.count) mythic keystone affix(s)")
                mythicKeystoneAbilityNumber = "\(mythicKeystoneAffixes.affixes.count)"

            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    func getMythicKeystoneAffix(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneAffix(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let mythicKeystoneAffix):
                Debug.print("Retrieved mythic keystone affix \(mythicKeystoneAffix.name)")
                firstMythicKeytoneAbility = "\(mythicKeystoneAffix.name)"
                abilityDescription = "\(mythicKeystoneAffix.description)"
                
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
