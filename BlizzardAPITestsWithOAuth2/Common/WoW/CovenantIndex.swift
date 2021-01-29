
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
    let name: String
    let description: String
    let signature_ability: CovenantSignatureAbility
    let class_abilities: [CovenantClassAbilities]
    //    let soulbinds: String
    //    let renown_rewards: String
    //    let media: MediaLink
}

class CovenantSignatureAbility: Codable {
    
    let id: Int
    let spell_tooltip: CovenantSpellTooltip
}

class CovenantSpellTooltip: Codable {
    
    let spell: CovenantSpell
    let description: String
    let cast_time: String
}

class CovenantSpell: Codable {
    
    let name: String
    let id: Int
}

class CovenantClassAbilities: Codable {
    
    let id: Int
    let playable_class: CovenantAbilityPlayableClass
    let spell_tooltip: CovenantAbilitySpellTooltip
}

class CovenantAbilityPlayableClass: Codable {
    
    let name: String
}

class CovenantAbilitySpellTooltip: Codable {
    
    let spell: CovenantAbilitySpellName
    let description: String
    let cast_time: String
    let power_cost: String?
    let range: String?
    let cooldown: String?
}

class CovenantAbilitySpellName: Codable {
    
    let name: String
}
