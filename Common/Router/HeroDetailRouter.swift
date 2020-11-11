//
//  HeroDetailRouter.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import UIKit

protocol IHeroDetailRouter: class {
}

class HeroDetailRouter: IHeroDetailRouter {
    weak var view: HeroDetailView?

    init(view: HeroDetailView?) {
        self.view = view
    }
//
//    func navigateToDetailPost(postId: Int) {
//        guard let module = GeneralRoute.detailPost(parameter: [Constants.ParamKey.postId: postId]).module as? DetailPostViewController else {
//            fatalError("Module not found")
//        }
//        let bottomSheet = GeneralRoute.bottomSheet(parameter: [Constants.ParamKey.module: module])
//        self.view?.navigate(type: .modal, module: bottomSheet)
//    }
//
//    func navigateToProfile() {
//        self.view?.navigate(type: .pushWithHideBottomBar, module: GeneralRoute.profile)
//    }
}
