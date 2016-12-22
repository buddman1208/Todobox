//
//  TaskListViewController.swift
//  Todobox
//
//  Created by Junseok Oh on 2016. 12. 18..
//  Copyright © 2016년 Junseok Oh. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var editButton: UIBarButtonItem!
  
  let doneButton: UIBarButtonItem = UIBarButtonItem(
    barButtonSystemItem: .done,
    target: nil,
    action: #selector(doneButtonDidTap)
  )
  
  var tasks: [Task] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadAll()
    self.doneButton.target = self
    self.tableView.backgroundColor = UIColor.green
  }
  
  func saveAll(){
    let dicts = self.tasks.map { task -> [String: Any] in
      return [
        "title": task.title,
        "done": task.done
      ]
    }
    UserDefaults.standard.set(dicts, forKey: "tasks")
    UserDefaults.standard.synchronize()
    
  }
  func loadAll(){
    guard let dicts = UserDefaults.standard.array(forKey: "tasks") as? [[String:Any]]
      else { return }
    
//    self.tasks = dicts.flatMap { dict -> Task? in
//      guard let title = dict["title"] as? String,
//        let done = dict["done"] as? Bool
//        else { return nil }
//      return Task(title: title, done: done)
//    }
// simplify
    self.tasks = dicts.flatMap(Task.init)
    self.tableView.reloadData()
  }
  
  @IBAction func editButtonDidTap(){
    self.navigationItem.leftBarButtonItem = self.doneButton
    self.tableView.setEditing(true, animated: true)
  }
  

  func doneButtonDidTap(){
    self.navigationItem.leftBarButtonItem = self.editButton
    self.tableView.setEditing(false, animated: true)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let navigationController = segue.destination as? UINavigationController,
      let rootViewController = navigationController.viewControllers.first,
      let taskEditViewController = rootViewController as? TaskEditViewController{
      
      taskEditViewController.didAddTask = { newTask in
        self.tasks.append(newTask)
        self.saveAll()
        self.tableView.reloadData()
      }
    }
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return tasks.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    let task = tasks[indexPath.row]
    cell.textLabel?.text = task.title
    cell.detailTextLabel?.text = task.memo
    if task.done {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var task = tasks[indexPath.row]
    task.done = !task.done
    tasks[indexPath.row] = task

    self.saveAll()
    tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    self.tasks.remove(at: indexPath.row)
    self.tableView.deleteRows(at: [indexPath], with: .automatic)
  }
}

