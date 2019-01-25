//
//  Themes.swift
//  PomodoroApp
//
//  Created by Ацамаз on 20/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

enum Themes: String {
    
    case violet = "Purple Lily"
    case black = "Black Space"
    case red = "Red Rose"
    case blue = "Sky Blue"
    
}


class MyTheme {
    
    private var currentTheme: Theme
    
    var mainColor: UIColor
    var darkenColor: UIColor
    
    var plusImage: UIImage
    var miniCircleImage: UIImage
    
    var iconName: String
    
    init(theme: Themes){
        
        switch theme {
        case .violet:
            currentTheme = VioletTheme()
        case .blue:
            currentTheme = BlueTheme()
        case .red:
            currentTheme = RedTheme()
        case .black:
            currentTheme = BlackTheme()
        }
        
        self.mainColor = currentTheme.mainColor
        self.darkenColor = currentTheme.darkenColor
        self.plusImage = currentTheme.plusImage
        self.miniCircleImage = currentTheme.miniCircleImage
        self.iconName = currentTheme.iconName
        
    }
    
}



protocol Theme {
    
    var mainColor: UIColor { get }
    var darkenColor: UIColor { get }
    
    var plusImage: UIImage { get }
    var miniCircleImage: UIImage { get }
    
    var iconName: String { get }
    
}


class VioletTheme: Theme {
    
    let mainColor: UIColor = #colorLiteral(red: 0.5647058824, green: 0.07843137255, blue: 0.9960784314, alpha: 1)
    let darkenColor: UIColor = #colorLiteral(red: 0.4078431373, green: 0.05490196078, blue: 0.7254901961, alpha: 1)
    
    let plusImage: UIImage = UIImage(named: "plusViolet")!
    let miniCircleImage: UIImage = UIImage(named: "miniCircleViolet")!
    
    let iconName: String = "VioletIcon"
    
}


class BlueTheme: Theme {
    
    let mainColor: UIColor = #colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1)
    let darkenColor: UIColor = #colorLiteral(red: 0.1044096133, green: 0.3324406561, blue: 0.4836144912, alpha: 1)
    
    let plusImage: UIImage = UIImage(named: "plusBlue")!
    let miniCircleImage: UIImage = UIImage(named: "miniCircleBlue")!
    
    let iconName: String = "BlueIcon"
    
}


class RedTheme: Theme {
    
    let mainColor: UIColor = #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
    let darkenColor: UIColor = #colorLiteral(red: 0.6219810103, green: 0.2046082198, blue: 0.1633485022, alpha: 1)
    
    let plusImage: UIImage = UIImage(named: "plusRed")!
    let miniCircleImage: UIImage = UIImage(named: "miniCircleRed")!
    
    let iconName: String = "RedIcon"
    
}


class BlackTheme: Theme {
    
    let mainColor: UIColor = #colorLiteral(red: 0.2039215686, green: 0.2862745098, blue: 0.368627451, alpha: 1)
    let darkenColor: UIColor = #colorLiteral(red: 0.1669373203, green: 0.2342528313, blue: 0.3024866335, alpha: 1)
    
    let plusImage: UIImage = UIImage(named: "plusBlack")!
    let miniCircleImage: UIImage = UIImage(named: "miniCircleBlack")!
    
    let iconName: String = "BlackIcon"
    
}
