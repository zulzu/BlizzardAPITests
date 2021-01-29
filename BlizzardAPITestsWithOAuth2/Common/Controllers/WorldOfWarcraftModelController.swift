
import Foundation


class WorldOfWarcraftModelController {
    
    static let shared = WorldOfWarcraftModelController()
    private init() { }
    
    // MARK: - Covenant Index API
    func getCovenantIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<CovenantIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getCovenantIndex(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    // MARK: - Covenant API
    func getCovenant(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<Covenant, HTTPError>) -> Void) {
        BattleNetAPI.wow.getCovenant(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
}
