
import SwiftUI

struct HomeView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open    
    let wowMC = WorldOfWarcraftModelController.shared
    let errorMsg: String = "Something bad happened, something really bad..."
    
    // # Private/Fileprivate
    @State private var covenantNames: Array<String> = []
    @State private var isCovenantLoaded = false

    // # Body
    var body: some View {
        
        VStack {
            
            Text("Hello, World of Warcraft!")
                .font(.headline)
                .fontWeight(.bold)
            
            if isCovenantLoaded {
                
                ForEach(0..<covenantNames.count, id: \.self) { (idx)  in
                    
                    Button("\(covenantNames[idx])") {
                        print("button tapped")
                    }
                    .frame(width: 220, height: 80, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    .accentColor(.black)
                    .padding()
                }
            }
        }
        .onAppear {
            getCovenantIndex()
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    func handleError(_ error: HTTPError, function: String = #function) {
        Debug.print(error.message, function: function)
    }
    
    // MARK: Covenant Index API
    func getCovenantIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getCovenantIndex(region: region, locale: locale) { result in
                switch result {
                case .success(let covenantIndex):
                    //                    Debug.print("Retrieved \(covenantIndex.covenants[0].name ?? temp)")
                    //                    Debug.print("Retrieved \(covenantIndex.covenants)")
                    //                    Debug.print("Retrieved \(covenantIndex.covenants.count)")
                    
                    let covenantCount = 1...covenantIndex.covenants.count
                    
                    for number in covenantCount {
                        covenantNames.append("\(covenantIndex.covenants[number - 1].name ?? errorMsg)")
                    }
                    isCovenantLoaded = true
                    
                case .failure(let error):
                    self.handleError(error)
                }
        }
    }
    
    // MARK: Covenant API
    func getCovenant(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getCovenant(id: id, region: region, locale: locale) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let covenant):
                    Debug.print("Retrieved \(covenant.name)")
                case .failure(let error):
                    self.handleError(error)
                }
            }
        }
    }
    
    // MARK: Mythic Keystone Affix API
    func getMythicKeystoneAffixes(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneAffixes(region: region, locale: locale) { result in
            switch result {
            case .success(let mythicKeystoneAffixes):
                Debug.print("Retrieved \(mythicKeystoneAffixes.affixes.count) mythic keystone affix(s)")
                
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
