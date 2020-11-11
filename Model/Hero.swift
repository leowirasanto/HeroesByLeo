//
//  Hero.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation

struct Hero {
    struct Response: Codable {
        var cm_enabled: Bool?
        var id: Int?
        var name: String?
        var localized_name: String?
        var primary_attr: String?
        var attack_type: String?
        var img: String?
        var icon: String?
        var base_health: Double?
        var base_health_regen: Double?
        var base_mana: Double?
        var base_mana_regen: Double?
        var base_armor: Double?
        var base_mr: Double?
        var base_attack_min: Double?
        var base_attack_max: Double?
        var base_str: Double?
        var base_agi: Double?
        var base_int: Double?
        var str_gain: Double?
        var agi_gain: Double?
        var int_gain: Double?
        var attack_range: Double?
        var projectile_speed: Double?
        var attack_rate: Double?
        var move_speed: Double?
        var turn_rate: Double?
        var legs: Double?
        var pro_win: Double?
        var pro_pick: Double?
        var hero_id: Double?
        var pro_ban: Double?
        var first_pick: Double?
        var first_win: Double?
        var second_pick: Double?
        var second_win: Double?
        var third_pick: Double?
        var third_win: Double?
        var fourth_pick: Double?
        var fourth_win: Double?
        var fifth_pick: Double?
        var fifth_win: Double?
        var sixth_pick: Double?
        var sixth_win: Double?
        var seventh_pick: Double?
        var seventh_win: Double?
        var eight_pick: Double?
        var eight_win: Double?
        var null_pick: Double?
        var null_win: Double?
        var roles: [String]?

        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case localized_name = "localized_name"
            case primary_attr = "primary_attr"
            case attack_type = "attack_type"
            case img = "img"
            case icon = "icon"
            case base_health = "base_health"
            case base_health_regen = "base_health_regen"
            case base_mana = "base_mana"
            case base_mana_regen = "base_mana_regen"
            case base_armor = "base_armor"
            case base_mr = "base_mr"
            case base_attack_min = "base_attack_min"
            case base_attack_max = "base_attack_max"
            case base_str = "base_str"
            case base_agi = "base_agi"
            case base_int = "base_int"
            case str_gain = "str_gain"
            case agi_gain = "agi_gain"
            case int_gain = "int_gain"
            case attack_range = "attack_range"
            case projectile_speed = "projectile_speed"
            case attack_rate = "attack_rate"
            case move_speed = "move_speed"
            case turn_rate = "turn_rate"
            case cm_enabled = "cm_enabled"
            case legs = "legs"
            case pro_win = "pro_win"
            case pro_pick = "pro_pick"
            case hero_id = "hero_id"
            case pro_ban = "pro_ban"
            case first_pick = "1_pick"
            case first_win = "1_win"
            case second_pick = "2_pick"
            case second_win = "2_win"
            case third_pick = "3_pick"
            case third_win = "3_win"
            case fourth_pick = "4_pick"
            case fourth_win = "4_win"
            case fifth_pick = "5_pick"
            case fifth_win = "5_win"
            case sixth_pick = "6_pick"
            case sixth_win = "6_win"
            case seventh_pick = "7_pick"
            case seventh_win = "7_win"
            case eight_pick = "8_pick"
            case eight_win = "8_win"
            case null_pick = "null_pick"
            case null_win = "null_win"
            case roles = "roles"
        }
    }
}
