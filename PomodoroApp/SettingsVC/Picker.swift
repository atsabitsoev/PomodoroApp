//
//  Picker.swift
//  PomodoroApp
//
//  Created by Ацамаз on 25/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(pickerView.tag)
        switch pickerView.tag {
        case 0:
            return themes.count
        case 1:
            return workMinutesArray.count
        case 2:
            return relaxMinutesArray.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return themes[row].rawValue
        case 1:
            return workMinutesArray[row]
        case 2:
            return relaxMinutesArray[row]
        default:
            return nil
        }
        
    }
    
}
