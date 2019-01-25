//
//  TableView.swift
//  PomodoroApp
//
//  Created by Ацамаз on 09/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

// TABLE VIEW
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // NUMBER OF ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfTaskNames.count
    }
    
    
    // CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        
        cell.labName.text = arrayOfTaskNames[indexPath.row]
        cell.labTimeSpent.text = arrayOfTaskTimes[indexPath.row]
        cell.labNumberOfPomodors.text = arrayOfCountOfCircles[indexPath.row]
        cell.imMiniCircle.image = self.currentTheme?.miniCircleImage
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // DELETING
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletingCell = tableView.cellForRow(at: indexPath) as! HomeCell
            let deletingTaskName = deletingCell.labName.text!
            presenter!.deleteTask(withName: deletingTaskName)
            
            self.updateTasksArrays()
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return NSLocalizedString("Удалить", comment: "delete")
    }
    
    
    // SELECT ROW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.cellSelected(at: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: NSLocalizedString("Изменить", comment: "Rename") ) {
                                            (action, view, performed) in
                                            
                                            let taskName = self.presenter!.arrayOfTaskNames()[indexPath.row]
                                            self.renameAlert(taskNameToChange: taskName)
                                            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    // ALERT TO RENAME TASK
    func renameAlert(taskNameToChange: String) {
        
        let alert = UIAlertController(title: NSLocalizedString("Новое имя", comment:  "Новое имя"),
                                      message: NSLocalizedString("Введите новое имя", comment: "Введите его") ,
                                      preferredStyle: .alert)
        
        alert.addTextField {(tf) in}
        let OkAction = UIAlertAction(title: NSLocalizedString("Изменить", comment: "Rename"), style: .default) { (action) in
            let newName = alert.textFields![0].text
            self.presenter!.changeNameOfTask(from: taskNameToChange, to: newName!)
            
            self.updateTasksArrays()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("Отмена", comment:  "Отмена"), style: .cancel) { (action) in}
        
        alert.addAction(OkAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}
