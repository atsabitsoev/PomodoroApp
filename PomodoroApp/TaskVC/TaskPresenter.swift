//
//  TaskPresenter.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class TaskPresenter: TaskPresenterProtocol {
    

    weak private var view: TaskViewProtocol?
    var interactor: TaskInteractorProtocol?
    private let router: TaskWireframeProtocol

    init(interface: TaskViewProtocol, interactor: TaskInteractorProtocol?, router: TaskWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    var currentTask = ""

    
    func getTaskName(byIndex index: Int) -> String {
        let taskName = interactor!.getArrayOfTasks()![index].name!
        currentTask = taskName
        return taskName
    }
    
    
    func closeButtonTapped() {
        self.interactor?.stopTimer()
        self.router.closeTaskVC()
    }
    
    
    func prepareTimeRest(timeRest: Int) {
        var timerType: TimerTypes
        var proportion: Float
        var minutes = 0
        var seconds = 0
        
        if timeRest <= Settings.standard.relaxMinutes * 60 {
            
            minutes = timeRest / 60
            seconds = timeRest - minutes * 60
            timerType = .relax
            proportion = (Float(Settings.standard.relaxMinutes * 60) - Float(timeRest)) / Float((Settings.standard.relaxMinutes * 60))
            
        } else {
            
            let tr = timeRest - Settings.standard.relaxMinutes * 60
            minutes = tr / 60
            seconds = tr - minutes * 60
            timerType = .work
            proportion = (Float(Settings.standard.workMinutes) * 60 - Float(tr)) / (Float(Settings.standard.workMinutes * 60))
            
        }
        
        let array = [String(minutes), String(seconds)]
        view?.arrayOfMinutesAndSeconds = array
        
        print(proportion)
        view?.setLevelOfBubbles(proportion: proportion, type: timerType)
    }
    
    
    func startButtonTapped() {
        
        let paused = UserDefaults.standard.bool(forKey: "timerPaused")
        let enabled = UserDefaults.standard.bool(forKey: "timerEnabled")
                
        if paused {
            
            interactor?.resumeTimer()
            
        } else if !enabled {
            
            interactor?.startingNewCircle()
            interactor?.startTimer()
            
        } else {
            
            interactor?.pauseTimer()
            
        }
        
    }
    
    
    func checkTimer() {
        
        let paused = UserDefaults.standard.bool(forKey: "timerPaused")
        let enabled = UserDefaults.standard.bool(forKey: "timerEnabled")
        
        if paused {
            
            interactor?.getTimeRest()
            
        } else if enabled {
            
            interactor?.startTimer()
            
        }
        
    }
    
    
}
