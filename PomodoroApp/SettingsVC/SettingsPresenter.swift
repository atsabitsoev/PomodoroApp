//
//  SettingsPresenter.swift
//  PomodoroApp
//
//  Created Ацамаз on 09/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SettingsPresenter: SettingsPresenterProtocol {

    weak private var view: SettingsViewProtocol?
    var interactor: SettingsInteractorProtocol?
    private let router: SettingsWireframeProtocol

    init(interface: SettingsViewProtocol, interactor: SettingsInteractorProtocol?, router: SettingsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    func setTheme(_ theme: Themes) {
        interactor?.setTheme(theme)
    }
    
    
    func preparedTotalTimeSpent() -> String {
        
        let totalTime = interactor!.totalTimeSpent()
        
        let hours = Int(totalTime/3600)
        let minutes = Int((Int(totalTime) - hours * 3600)/60)
        
        let string1 = NSLocalizedString(" часов ", comment: "часов")
        let string2 = NSLocalizedString(" минут", comment: "минут")
        
        let string = String(hours) + string1 + String(minutes) + string2
        
        return string
        
    }
    
    
    func mainTaskName() -> String {
        
        if let mainTask = interactor?.mainTask() {
            
            return mainTask.name!
            
        } else {
            
            return "..."
            
        }
        
    }
    

}
