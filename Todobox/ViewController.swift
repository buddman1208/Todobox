//
//  ViewController.swift
//  Todobox
//
//  Created by Junseok Oh on 2016. 12. 18..
//  Copyright © 2016년 Junseok Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    var tasks: [Task] = [
        Task(title: "원준갓", memo: "일해라"),
        Task(title: "원준갓1", memo: "일해라4"),
        Task(title: "원준갓2", memo: "일해라3"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.green
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
        print(task.title)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
}

