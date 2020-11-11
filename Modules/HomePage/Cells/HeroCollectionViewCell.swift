//
//  HeroCollectionViewCell.swift
//  HeroesByLeo
//
//  Created by Leo on 11/11/20.
//

import UIKit
import Alamofire

class HeroCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeroCollectionViewCell"
    @IBOutlet weak var heroContentView: UIView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(hero: Hero.Response) {
        let imgPath: String? = "https://api.opendota.com\(hero.img ?? "")"
        heroImage.setImage(urlString: imgPath)
        heroName.text = hero.localized_name
    }
}
