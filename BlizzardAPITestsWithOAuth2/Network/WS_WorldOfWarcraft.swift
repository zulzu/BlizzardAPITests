
import Foundation

class WS_WorldOfWarcraft: WebService {
    
    private let network = Network.shared
    
    internal func getBaseURL(region: APIRegion, apiType: APIType?) -> String {
        var url = region.apiURI
        
        if let apiType = apiType {
            switch apiType {
            case .gameData:
                url += "/data/wow"
            case .community:
                url += "/wow"
            case .profile:
                url += "/profile/wow"
            }
        }
        
        return url
    }
    
    // MARK: Covenant Index API
    /**
     Returns an index of covenants
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getCovenantIndex(region: APIRegion, locale: APILocale?, completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        let apiType: APIType = .gameData
        var urlStr = getBaseURL(region: region, apiType: apiType) + "/covenant/index"
        urlStr = appendSharedURLParameters(to: urlStr, withNamespace: "static", region: region, locale: locale)
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    // MARK: Covenant API
    /**
     Returns a covenant by ID
     - parameter id: The ID of the Covenant
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getCovenant(id: Int, region: APIRegion, locale: APILocale?, completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        let apiType: APIType = .gameData
        var urlStr = getBaseURL(region: region, apiType: apiType) + "/covenant/\(id)"
        urlStr = appendSharedURLParameters(to: urlStr, withNamespace: "static", region: region, locale: locale)
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
}
