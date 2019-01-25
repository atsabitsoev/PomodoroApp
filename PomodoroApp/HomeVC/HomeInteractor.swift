//
//  HomeInteractor.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeInteractor: HomeInteractorProtocol {
    

    weak var presenter: HomePresenterProtocol?
    
    func saveTask(withName name: String) -> Bool {
        return CoreDataService.standard.saveTask(withName: name)
    }
    
    func arrayOfTasks() -> [Task] {
        return CoreDataService.standard.arrayofTasks()
    }
    
    func deleteTask(withName name: String) {
        CoreDataService.standard.deleteTask(withName: name)
    }
    
    func changeNameOfTask(from: String, to: String) {
        CoreDataService.standard.changeNameOfTask(from: from, to: to)
    }
}