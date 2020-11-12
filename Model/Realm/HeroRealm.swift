//
//  HeroRealm.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import RealmSwift

class HeroRealm: RealmObject {
    @objc dynamic var cm_enabled: Bool = false
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var localized_name: String?
    @objc dynamic var primary_attr: String?
    @objc dynamic var attack_type: String?
    @objc dynamic var img: String?
    @objc dynamic var icon: String?
    @objc dynamic var base_health: Double = 0.0
    @objc dynamic var base_health_regen: Double = 0.0
    @objc dynamic var base_mana: Double = 0.0
    @objc dynamic var base_mana_regen: Double = 0.0
    @objc dynamic var base_armor: Double = 0.0
    @objc dynamic var base_mr: Double = 0.0
    @objc dynamic var base_attack_min: Double = 0.0
    @objc dynamic var base_attack_max: Double = 0.0
    @objc dynamic var base_str: Double = 0.0
    @objc dynamic var base_agi: Double = 0.0
    @objc dynamic var base_int: Double = 0.0
    @objc dynamic var str_gain: Double = 0.0
    @objc dynamic var agi_gain: Double = 0.0
    @objc dynamic var int_gain: Double = 0.0
    @objc dynamic var attack_range: Double = 0.0
    @objc dynamic var projectile_speed: Double = 0.0
    @objc dynamic var attack_rate: Double = 0.0
    @objc dynamic var move_speed: Double = 0.0
    @objc dynamic var turn_rate: Double = 0.0
    @objc dynamic var legs: Double = 0.0
    @objc dynamic var pro_win: Double = 0.0
    @objc dynamic var pro_pick: Double = 0.0
    @objc dynamic var hero_id: Double = 0.0
    @objc dynamic var pro_ban: Double = 0.0
    @objc dynamic var first_pick: Double = 0.0
    @objc dynamic var first_win: Double = 0.0
    @objc dynamic var second_pick: Double = 0.0
    @objc dynamic var second_win: Double = 0.0
    @objc dynamic var third_pick: Double = 0.0
    @objc dynamic var third_win: Double = 0.0
    @objc dynamic var fourth_pick: Double = 0.0
    @objc dynamic var fourth_win: Double = 0.0
    @objc dynamic var fifth_pick: Double = 0.0
    @objc dynamic var fifth_win: Double = 0.0
    @objc dynamic var sixth_pick: Double = 0.0
    @objc dynamic var sixth_win: Double = 0.0
    @objc dynamic var seventh_pick: Double = 0.0
    @objc dynamic var seventh_win: Double = 0.0
    @objc dynamic var eight_pick: Double = 0.0
    @objc dynamic var eight_win: Double = 0.0
    @objc dynamic var null_pick: Double = 0.0
    @objc dynamic var null_win: Double = 0.0
    var roles = List<String>()

    override class func primaryKey() -> String? {
        return "id"
    }

    convenience init(response: Hero.Response) {
        self.init()
        self.cm_enabled = response.cm_enabled ?? false
        self.id = response.id ?? 0
        self.name = response.name
        self.localized_name = response.localized_name
        self.primary_attr = response.primary_attr
        self.attack_type = response.attack_type
        self.img = response.img
        self.icon = response.icon
        self.base_health = response.base_health ?? 0
        self.base_health_regen = response.base_health_regen ?? 0
        self.base_mana = response.base_mana ?? 0
        self.base_mana_regen = response.base_mana_regen ?? 0
        self.base_armor = response.base_armor ?? 0
        self.base_mr = response.base_mr ?? 0
        self.base_attack_min = response.base_attack_min ?? 0
        self.base_attack_max = response.base_attack_max ?? 0
        self.base_str = response.base_str ?? 0
        self.base_agi = response.base_agi ?? 0
        self.base_int = response.base_int ?? 0
        self.str_gain = response.str_gain ?? 0
        self.agi_gain = response.agi_gain ?? 0
        self.int_gain = response.int_gain ?? 0
        self.attack_range = response.attack_range ?? 0
        self.projectile_speed = response.projectile_speed ?? 0
        self.attack_rate = response.attack_rate ?? 0
        self.move_speed = response.move_speed ?? 0
        self.turn_rate = response.turn_rate ?? 0
        self.legs = response.legs ?? 0
        self.pro_win = response.pro_win ?? 0
        self.pro_pick = response.pro_pick ?? 0
        self.hero_id = response.hero_id ?? 0
        self.pro_ban = response.pro_ban ?? 0
        self.first_pick = response.first_pick ?? 0
        self.first_win = response.first_win ?? 0
        self.second_pick = response.second_pick ?? 0
        self.second_win = response.second_win ?? 0
        self.third_pick = response.third_pick ?? 0
        self.third_win = response.third_win ?? 0
        self.fourth_pick = response.fourth_pick ?? 0
        self.fourth_win = response.fourth_win ?? 0
        self.fifth_pick = response.fifth_pick ?? 0
        self.fifth_win = response.fifth_win ?? 0
        self.sixth_pick = response.sixth_pick ?? 0
        self.sixth_win = response.sixth_win ?? 0
        self.seventh_pick = response.seventh_pick ?? 0
        self.seventh_win = response.seventh_win ?? 0
        self.eight_pick = response.eight_pick ?? 0
        self.eight_win = response.eight_win ?? 0
        self.null_pick = response.null_pick ?? 0
        self.null_win = response.null_win ?? 0
        self.roles = getRoles(roles: response.roles ?? [])
    }

    private func getRoles(roles: [String]) -> List<String> {
        let result = List<String>()
        for role in roles {
            result.append(role)
        }
        return result
    }
}
