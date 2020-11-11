//
//  UIImage+UIImageView.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImage {

}

extension UIImageView {
    func setImage(url: URL? = nil,urlString: String? = nil) {
        if let url1 = url {
            self.af.setImage(withURL: url1)
        } else if let urlStr = urlString, let url1 = URL(string: urlStr) {
            self.af.setImage(withURL: url1)
        }
    }
}
