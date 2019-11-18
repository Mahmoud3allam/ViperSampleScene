//
//  TracksRouter.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
class TracksViewRouter: TracksRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule() -> UIViewController {
        let interactor = TracksInteractor()
        let router = TracksViewRouter()
        let view = TracksViewController()
        let presenter = TracksPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
