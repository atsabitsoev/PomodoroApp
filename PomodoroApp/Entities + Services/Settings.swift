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
    
    var myRelaxMinutes: Int = 5
    
    var relaxMinutes: Int {
        get {
            
            if UserDefaults.standard.integer(forKey: "circleNum") != bigBreakEvery {
                return myRelaxMinutes
            } else {
                return bigBreak
            }
            
        }
        
        set {
            
            myRelaxMinutes = newValue
            
        }
    }
    
    var sumMinutes: Int {
        get {
            return workMinutes + relaxMinutes
        }
    }
    
    var bigBreak: Int = 20
    
    var bigBreakEvery: Int = 4 // Circles
    
}
