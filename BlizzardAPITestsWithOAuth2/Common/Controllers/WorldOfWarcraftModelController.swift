
import Foundation


class WorldOfWarcraftModelController {
    
    static let shared = WorldOfWarcraftModelController()
    private init() { }
    
    // MARK: - Mythic Keystone Affix API
    func getMythicKeystoneAffixes(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<KeystoneAffixIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneAffixes(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    func getMythicKeystoneAffix(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<KeystoneAffix, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneAffix(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
}
