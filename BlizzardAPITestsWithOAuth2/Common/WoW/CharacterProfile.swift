
import Foundation


class CharacterProfile: Codable {
    
    let _links: SelfLink<CharacterProfile>
    let id: Int
    let name: String
    let gender: String
    let faction: String
    let race: String
    let characterClass: String
    let activeSpec: String
    let realm: String
    let guild: String
    let level: Int
    let experience: Int
    let achievementPoints: Int
    let achievements: String
    let titles: String
    let pvpSummary: String
    let encounters: String
    let media: String
    let lastLogin: Int
    let averageItemLevel: Int
    let equippedItemLevel: Int
    let specializations: String
    let statistics: String
    let mythicKeystoneProfile: String
    let equipment: String
    let appearance: String
    let collections: String
    let activeTitle: String
    let reputations: String
    let quests: String
    let achievementsStatistics: String
    let professions: String
    let covenantProgress: String
}
