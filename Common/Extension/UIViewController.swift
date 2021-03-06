//
//  UIViewController.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

enum DeviceOrientation {
    case portrait
    case landscape
}

extension UIViewController {
    var orientation: DeviceOrientation {
        let size = UIScreen.main.bounds
        return size.width > size.height ? .landscape : .portrait
    }

    func showAlert(error: HeroError) {
        let title = error == .noConnection ? "No Internet Connection" : "Opps!"
        let message = error == .noConnection ? "Please make sure that your device is connected to Internet" : "Something went wrong"
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        self.present(alertVC, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                alertVC.dismiss()
            }
        }
    }

    // still not working
    func showErrorView(error: HeroError) {
        let errorView = ErrorView.getView()
        errorView.tag = 123
        errorView.setup(error: error)
        errorView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(errorView)
        NSLayoutConstraint.activate([
            errorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            errorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            errorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        self.view.bringSubviewToFront(errorView)
    }

    func removeErrorView() {
        self.view.subviews.forEach { view in
            if view.tag == 123 {
                view.removeFromSuperview()
            }
        }
    }
}
