//
//  FilterTableViewCell.swift
//  HeroesByLeo
//
//  Created by Leo on 11/11/20.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    static let identifier = "FilterTableViewCell"
    @IBOutlet weak var filterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        filterLabel.roundCorners(with: filterLabel.bounds.height / 2)
        selectionStyle = .none
    }

    func setup(value: String) {
        filterLabel.text = value
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
