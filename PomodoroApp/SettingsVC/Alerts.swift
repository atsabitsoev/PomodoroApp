//
//  Alerts.swift
//  PomodoroApp
//
//  Created by Ацамаз on 25/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

extension SettingsViewController {
    
    //Theme Alert
    func themeAlert(previousTheme prev: String) {
        
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        
        let picker = UIPickerView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: alert.view.bounds.width - 20,
                                                height: 200))
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 0
        picker.center.x = alert.view.center.x - 7.5
        let currentThemeName = tableView.cellForRow(at: [0,0])?.detailTextLabel!.text!
        let currentTheme = Themes(rawValue: currentThemeName!)
        picker.selectRow(themes.firstIndex(of: currentTheme!)!, inComponent: 0, animated: false)
        alert.view.addSubview(picker)
        
        let ok = UIAlertAction(title: NSLocalizedString("Выбрать", comment: "set"), style: .default) { (action) in
            
            let selectedTheme = self.themes[picker.selectedRow(inComponent: 0)]
            self.tableView.cellForRow(at: [0,0])?.detailTextLabel!.text = selectedTheme.rawValue
            self.setTheme(selectedTheme)
            self.tableView.deselectRow(at: [0,0], animated: true)
            
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
    }
    
    
    // Minutes Alet
    func minutesAlert(type: TimerTypes) {
        
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        
        let picker = UIPickerView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: alert.view.bounds.width - 20,
                                                height: 200))
        picker.delegate = self
        picker.dataSource = self
        picker.center.x = alert.view.center.x - 7.5
        
        var currentArray = [String]()
        var key = String()
        var currentMinutes: String?
        
        switch type {
        case .work:
            picker.tag = 1
            currentArray = workMinutesArray
            key = "workMinutes"
            currentMinutes = tableView.cellForRow(at: [1,0])?.detailTextLabel!.text!
        case .relax:
            picker.tag = 2
            currentArray = relaxMinutesArray
            key = "relaxMinutes"
            currentMinutes = tableView.cellForRow(at: [1,1])?.detailTextLabel!.text!
        }
        
        currentMinutes = currentMinutes!.onlyNumbers()
        picker.selectRow(currentArray.firstIndex(of: currentMinutes!)!, inComponent: 0, animated: false)
        
        alert.view.addSubview(picker)
        
        let ok = UIAlertAction(title: NSLocalizedString("Выбрать", comment: "set"), style: .default) { (action) in
            
            let index = picker.selectedRow(inComponent: 0)
            let minuteString = String(currentArray[index])
            
            UserDefaults.standard.set(Int(minuteString), forKey: key)
            
            switch type {
            case.work:
                Settings.standard.workMinutes = Int(minuteString)!
            case .relax:
                Settings.standard.relaxMinutes = Int(minuteString)!
            }
            
            switch type {
            case .work:
                
                self.tableView.cellForRow(at: [1,0])!.detailTextLabel!.text = minuteString + NSLocalizedString(" минут", comment: "в работе")
                self.tableView.deselectRow(at: [1,0], animated: true)
                
            case .relax:
                
                self.tableView.cellForRow(at: [1,1])!.detailTextLabel!.text = minuteString + NSLocalizedString(" минут", comment: "в отдыхе")
                self.tableView.deselectRow(at: [1,1], animated: true)
                
            }
            
        }
        
        alert.addAction(ok)
        
        print("ща покажу")
        self.present(alert, animated: true)
        
    }
    
}
