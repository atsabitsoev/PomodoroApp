//
//  HomeProtocols.swift
//  PomodoroApp
//
//  Created Ацамаз on 07/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeWireframeProtocol: class {
    func presentSettingsVC()
    func presentTaskVc(indexOfTask: Int)
}
//MARK: Presenter -
protocol HomePresenterProtocol: class {
    
    func saveTask(withName name: String) -> Bool
    func arrayOfTaskNames() -> [String]
    func arrayOfTaskTimeSpent() -> [String]
    func deleteTask(withName name: String)
    func changeNameOfTask(from: String, to: String)
    func settingsButtonTapped()
    func cellSelected(at indexPath: IndexPath)
    func arrayOfCountOfCircles() -> [String]
    func randomMotivation() -> String?
    
}

//MARK: Interactor -
protocol HomeInteractorProtocol: class {

    var presenter: HomePresenterProtocol?  { get set }
    
    func saveTask(withName name: String) -> Bool
    func arrayOfTasks() -> [Task]
    func deleteTask(withName name: String)
    func changeNameOfTask(from: String, to: String)
    
    var motivations: [String] { get }
    
}

//MARK: View -
protocol HomeViewProtocol: class {

  var presenter: HomePresenterProtocol?  { get set }
}
