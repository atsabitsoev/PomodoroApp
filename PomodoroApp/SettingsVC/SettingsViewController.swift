//
//  SettingsViewController.swift
//  PomodoroApp
//
//  Created Ацамаз on 09/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SettingsViewController: UITableViewController, SettingsViewProtocol {
    
    

	var presenter: SettingsPresenterProtocol?
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        
    }
    
    
    // CELL
    let themeText: String = NSLocalizedString("Тема", comment: "Тема")
    let workText = NSLocalizedString("Работа", comment: "Работа")
    let relaxText = NSLocalizedString("Отдых", comment: "Отдых")
    let totalText = NSLocalizedString("Всего в работе", comment: "Всего в работе")
    let mainTaskText = NSLocalizedString("Главная задача", comment: "Главная задача")
    
    var section0Texts = [String]()
    var section1Texts = [String]()
    var section2Texts = [String]()
    
    var tableViewTexts = [[String]]()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell")
        
        cell?.textLabel?.text = tableViewTexts[indexPath.section][indexPath.row]
        
        switch indexPath {
            
        case [0,0]:
            
            cell?.detailTextLabel!.text = UserDefaults.standard.string(forKey: "theme") ?? "Red Rose"

        case [1,0]:
            
            let workMinutes = Settings.standard.workMinutes
            cell?.detailTextLabel!.text = String(workMinutes) + NSLocalizedString(" минут", comment: "в работе")
            
        case [1,1]:
            
            let relaxMinutes = Settings.standard.relaxMinutes
            cell?.detailTextLabel!.text = String(relaxMinutes) +  NSLocalizedString(" минут", comment: "в работе")
            
        case [2,0]:
            
            cell?.detailTextLabel?.text = presenter?.preparedTotalTimeSpent()
            
        case [2,1]:
            
            cell?.detailTextLabel?.text = presenter?.mainTaskName()
            
        default:
            
            print("hello")
            
        }
        
        return cell!
        
    }
    
    
    // PREPARE TABLEVIEW
    func prepareTableView() {

        section0Texts = [themeText]
        section1Texts = [workText, relaxText]
        section2Texts = [totalText, mainTaskText]
        
        tableViewTexts = [section0Texts, section1Texts, section2Texts]
        
    }
    
    
    // NUMBER OF SECTIONS
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0:
            
            return NSLocalizedString("Оформление", comment: "Оформление")
            
        case 1:
            
            return NSLocalizedString("Таймер", comment: "Таймер")
            
        case 2:
            
            return NSLocalizedString("Статистика", comment: "Статистика")
            
        default:
            
            return nil
            
        }
    }
    
    
    // NUMBER OF ROWS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 1
        }
        
    }
    
    
    // SELECT ROW
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath {
            
        case [0,0]:
            
            themeAlert(previousTheme: tableView.cellForRow(at: indexPath)!.detailTextLabel!.text!)

        case [1,0]:
            
            minutesAlert(type: .work)
            
        case [1,1]:
            
            minutesAlert(type: .relax)
            
        default:
            print("error")
            
        }
        
    }
    
    
    // SET THEME
    func setTheme(_ theme: Themes) {
        
        presenter?.setTheme(theme)
        
    }
    
    
    // PICKER
    let themes: [Themes] = [.black, .blue, .violet, .red]
    let workMinutesArray = ["25","30","35","40","45","50"]
    let relaxMinutesArray = ["5","6","7","8","9","10"]
    
    
}



