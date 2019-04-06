//
//  CoreDataService.swift
//  PomodoroApp
//
//  Created by Ацамаз on 08/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService {
    
    // SINGLETON
    static var standard = CoreDataService()
    private init () {}
    
    
    // SAVE NEW TASK
    func saveTask(withName name: String) -> Bool {
        if !existTask(withName: name){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
        
            let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
            let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        
            taskObject.name = name
        
            do {
                try context.save()
            } catch {
                print(error)
            }
            
            return true
        } else { return false }
    }
    
    
    // GET ARRAY OF TASKS
    func arrayofTasks() -> [Task] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print(error)
            return []
        }
    }
    
    
    // GET TASK BY NAME
    func getTask(byName name: String) -> Task? {
        for task in arrayofTasks() {
            if task.name == name {
                return task
            }
        }
        return nil
    }
    
    
    // CHECK EXISTENCE OF TASK
    private func existTask(withName name: String) -> Bool {
        if getTask(byName: name) == nil {
            return false
        } else { return true }
    }
    
    // DELETE TASK
    func deleteTask(withName name: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let taskToDelete = getTask(byName: name)!
        context.delete(taskToDelete)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    // CHANGING THE NAME OF THE TASK
    func changeNameOfTask(from: String, to: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        getTask(byName: from)?.name = to
    
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    // ADD TIME TO TASK
    func addTimeToTask(name: String, timeToAdd time: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let task = getTask(byName: name)
        task?.timeSpent += Double(time)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
    }
    
}
