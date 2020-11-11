//
//  HeroDetailView.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import UIKit
import AlamofireImage

protocol IHeroDetailView: class {
    var router: IHeroDetailRouter? { get set }
}

class HeroDetailView: UIViewController {
    var router: IHeroDetailRouter?
    var interactor: IHeroDetailInteractor?

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var typeIcon: UIImageView!
    @IBOutlet weak var similarHeroStack: UIStackView!
    @IBOutlet var similarHeroesIcons: [UIImageView]!

    var relatedHeroes: [Hero.Response] {
        guard let related = interactor?.parameters?["relatedHeroes"] as? [Hero.Response] else { return [] }
        return related
    }
    var selectedHero: Hero.Response? {
        return interactor?.parameters?["selectedHero"] as? Hero.Response
    }

    override func viewDidLoad() {
        bindData()
    }

    private func bindData() {
        let imgPath: String? = "https://api.opendota.com\(selectedHero?.img ?? "")"
        detailImage.setImage(urlString: imgPath)
        nameLabel.text = selectedHero?.localized_name

        var roles = ""
        selectedHero?.roles?.forEach({ role in
            roles.append("\(role) ")
        })
        roleLabel.text = "Role:\n\(roles)"

        attrLabel.text = selectedHero?.primary_attr
        speedLabel.text = "\(selectedHero?.move_speed ?? 0)"
        hpLabel.text = "\(selectedHero?.base_health ?? 0)"
        attackLabel.text = "\(selectedHero?.base_attack_max ?? 0)"

        for (index, hero) in relatedHeroes.enumerated() {
            let imgPath: String? = "https://api.opendota.com\(hero.img ?? "")"
            similarHeroesIcons[index].setImage(urlString: imgPath)
        }

        if selectedHero?.attack_type?.lowercased() ?? "melee" == "melee" {
            typeIcon.image = #imageLiteral(resourceName: "melee.png")
        } else {
            typeIcon.image = #imageLiteral(resourceName: "ranged")
        }
    }
}

extension HeroDetailView: IHeroDetailView {

}