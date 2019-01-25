//
//  HomePresenter.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    

    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeWireframeProtocol

    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    func saveTask(withName name: String) -> Bool {
        return interactor!.saveTask(withName: name)
    }
    
    
    func arrayOfCountOfCircles() -> [String] {
        let arrTasks = interactor?.arrayOfTasks()
        
        
        if arrTasks?.count != 0 {
            
            var arrToReturn = [String]()
            
            for task in arrTasks! {
                let time = task.timeSpent
                let countOfCircles = Int(time / (Double(Settings.standard.workMinutes) * 60))
                arrToReturn.append(String(countOfCircles))
            }
            
            return arrToReturn
            
        } else {
            return []
        }
        
    }
    
    
    func arrayOfTaskNames() -> [String] {
        let arrayOfTasks = interactor?.arrayOfTasks()
        
        if arrayOfTasks?.count != 0 {
            var arrayOfNames = [String]()
            for task in arrayOfTasks!{
                arrayOfNames.append(task.name!)
            }
            return arrayOfNames
        } else { return [] }
    }
    
    
    func arrayOfTaskTimeSpent() -> [String] {
        
        var arrayOfTimeSpent = [String]()
        for task in (interactor?.arrayOfTasks())! {
            let hours = Int(task.timeSpent/3600)
            let minutes = Int((Int(task.timeSpent) - hours * 3600)/60)
            
            let vsego = NSLocalizedString("Всего: ", comment: "всего")
            let chasov = NSLocalizedString(" часов ", comment: "hours")
            let minut =  NSLocalizedString(" минут", comment: "minutes")
            arrayOfTimeSpent.append(vsego + "\(hours)" + chasov + "\(minutes)" + minut)
            
        }
        return arrayOfTimeSpent
    }
    
    
    func deleteTask(withName name: String) {
        interactor?.deleteTask(withName: name)
    }

    
    func changeNameOfTask(from: String, to: String) {
        interactor?.changeNameOfTask(from: from, to: to)
    }
    
    
    func settingsButtonTapped() {
        router.presentSettingsVC()
    }
    
    
    func cellSelected(at indexPath: IndexPath) {
        router.presentTaskVc(indexOfTask: indexPath.row)
    }
}
