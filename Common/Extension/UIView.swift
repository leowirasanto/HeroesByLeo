//
//  UIView.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(with radius: CGFloat = 5) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = rectShape
    }
}
