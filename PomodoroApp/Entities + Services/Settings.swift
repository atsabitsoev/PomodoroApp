//
//  Settings.swift
//  PomodoroApp
//
//  Created by Ацамаз on 20/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import Foundation

class Settings {
    
    static let standard = Settings()
    private init(){}
    
    
    var workMinutes: Int = 25
    
    var relaxMinutes: Int = 5
    
    var sumMinutes: Int {
        
        get {
            
            return workMinutes + relaxMinutes
            
        }
    
    
    }
}
