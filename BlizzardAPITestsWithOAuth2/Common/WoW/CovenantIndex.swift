
import Foundation


class CovenantIndex: Codable {
    
    let _links: SelfLink<CovenantIndex>
    let covenants: [KeyLink<CovenantIndexCovenant>]
}

class CovenantIndexCovenant: Codable {
    
    let _key: SelfLink<CovenantIndexCovenant>
    let name: String
    let id: Int
}

class Covenant: Codable {
    
    let _links: SelfLink<Covenant>
    let id: Int
    var name: String
    let description: String
    let signature_ability: CovenantSignatureAbility
//    let class_abilities: String
//    let soulbinds: String
//    let renown_rewards: String
//    let media: MediaLink
}

class CovenantSignatureAbility: Codable {
    
    let id: Int
    var spell_tooltip: CovenantSpellTooltip
}

class CovenantSpellTooltip: Codable {
    
    let spell: CovenantSpell
    let description: String
    var cast_time: String
}

class CovenantSpell: Codable {
    
    let name: String
    let id: Int
}


