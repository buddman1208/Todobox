//
//  TaskEditViewController.swift
//  Todobox
//
//  Created by Junseok Oh on 2016. 12. 19..
//  Copyright © 2016년 Junseok Oh. All rights reserved.
//

import UIKit

class TaskEditViewController: UIViewController{
    
    @IBOutlet
    var titleInput: UITextField!
    @IBOutlet
    var memoInput: UITextView!
    
    
    @IBAction func cancelButtonDidTap(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonDidTap(){
        guard let title = titleInput.text,
            let navigationController = self.presentingViewController as? UINavigationController,
            let taskListViewController = navigationController.viewControllers.first as? ViewController
            else { return }
        let newTask = Task(title: title)
      taskListViewController.tasks.append(newTask)
      taskListViewController.tableView.reloadData()
      self.dismiss(animated: true, completion: nil)
      
      
    }
}
