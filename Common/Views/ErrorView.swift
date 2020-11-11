//
//  ErrorView.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import UIKit

class ErrorView: UIView {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    

    static func getView() -> ErrorView {
        guard let view = Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil)?.first as? ErrorView else { fatalError("View Not Found") }
        return view
    }

    func setup(error: HeroError) {
        switch error {
        case .noConnection:
            iconView.image = #imageLiteral(resourceName: "no-wifi.png")
            titleLabel.text = "No Connection"
            messageLabel.text = "Please make sure that your device is connected to the Internet connection"
        case .noData:
            iconView.image = #imageLiteral(resourceName: "warning.png")
            titleLabel.text = "Something Went Error"
            messageLabel.text = "Cannot get your data. Please try again in a minute"
        }
    }
}
