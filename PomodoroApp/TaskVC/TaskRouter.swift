//
//  TaskRouter.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class TaskRouter: TaskWireframeProtocol {

    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Task") as! TaskViewController
        let interactor = TaskInteractor()
        let router = TaskRouter()
        let presenter = TaskPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    func closeTaskVC() {
        viewController?.dismiss(animated: true)
    }
    
    
}
