//
//  HomeRouter.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeRouter: HomeWireframeProtocol {
    
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = (UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! UINavigationController).viewControllers[0] as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        print("я тут")
        return view
    }
    
    
    func presentSettingsVC() {
        viewController?.navigationController?.show(SettingsRouter.createModule(), sender: nil)
    }
    
    func presentTaskVc(indexOfTask: Int) {
        let taskVC = TaskRouter.createModule() as! TaskViewController
        taskVC.indexOfCurrentTask = indexOfTask
        viewController?.present(taskVC, animated: true)
    }
}
