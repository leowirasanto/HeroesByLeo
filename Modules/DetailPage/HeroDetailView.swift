//
//  HeroDetailView.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import UIKit
import AlamofireImage
import RealmSwift

protocol IHeroDetailView: class {
    var router: IHeroDetailRouter? { get set }
    func displayRelatedHero(related: [Hero.Response])
    func displaySelectedHero(selected: HeroRealm)
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

    var relatedHeroes: [Hero.Response] = []
    var selected: HeroRealm?
    let realmService = RealmService.share

    override func viewDidLoad() {
        interactor?.fetchHeroDetail()
    }

    private func bindData() {
        let imgPath: String? = "\(Configs.imageBaseUrl.rawValue)\(selected?.img ?? "")"
        detailImage.setImage(urlString: imgPath)
        nameLabel.text = selected?.localized_name

        var roles = ""
        selected?.roles.forEach({ role in
            roles.append("\(role) ")
        })
        roleLabel.text = "Role:\n\(roles)"

        attrLabel.text = selected?.primary_attr
        speedLabel.text = "\(selected?.move_speed ?? 0)"
        hpLabel.text = "\(selected?.base_health ?? 0)"
        attackLabel.text = "\(selected?.base_attack_max ?? 0)"

        for (index, hero) in relatedHeroes.enumerated() {
            let imgPath: String? = "\(Configs.imageBaseUrl.rawValue)\(hero.img ?? "")"
            similarHeroesIcons[index].setImage(urlString: imgPath)
        }

        if selected?.attack_type?.lowercased() ?? Configs.melee.rawValue == Configs.melee.rawValue {
            typeIcon.image = #imageLiteral(resourceName: "melee.png")
        } else {
            typeIcon.image = #imageLiteral(resourceName: "ranged")
        }
    }
}

extension HeroDetailView: IHeroDetailView {
    func displayRelatedHero(related: [Hero.Response]) {
        relatedHeroes = related
    }

    func displaySelectedHero(selected: HeroRealm) {
        self.selected = selected
        bindData()
    }
}
