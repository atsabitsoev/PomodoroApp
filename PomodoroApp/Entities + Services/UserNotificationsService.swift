//
//  UserNotificationsService.swift
//  PomodoroApp
//
//  Created by Ацамаз on 19/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import Foundation
import UserNotifications

class UNService {
    
    static let standard = UNService()
    private init() {}
    
    func createNotifications(triggerDate: Date) {
        
        let workMinutesString = String(Settings.standard.workMinutes)
        
        let content2 = UNMutableNotificationContent()
        content2.title = NSLocalizedString("Отдыхайте", comment: "отдыхайте")
        content2.body = NSLocalizedString("\(workMinutesString) минут позади, теперь можно и передохнуть", comment: "надо отдых")
        content2.sound = UNNotificationSound(named: UNNotificationSoundName("startRelax.caf"))
        
        let content1 = UNMutableNotificationContent()
        content1.title = NSLocalizedString("Круг завершен", comment: "завершен")
        content1.body = NSLocalizedString("Начните новый круг, если хотите продолжить", comment: "новый")
        content1.sound = UNNotificationSound(named: UNNotificationSoundName("endRelax.caf"))
        
        let components1 = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute,.second], from: triggerDate)
        let components2 = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute,.second], from: Date(timeInterval: TimeInterval(-Settings.standard.relaxMinutes * 60), since: triggerDate))
        
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: components1, repeats: false)
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: components2, repeats: false)
        
        let identifier2 = "relaxStarted"
        let identifier1 = "relaxEnded"
        
        let request1 = UNNotificationRequest(identifier: identifier1, content: content1, trigger: trigger1)
        let request2 = UNNotificationRequest(identifier: identifier2, content: content2, trigger: trigger2)
        
        let center = UNUserNotificationCenter.current()
        center.add(request1, withCompletionHandler: nil)
        center.add(request2, withCompletionHandler: nil)

    }
    
    
    func deleteAllNotifications() {
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
    }
    
}
