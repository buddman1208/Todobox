//
//  TaskEditViewController.swift
//  Todobox
//
//  Created by Junseok Oh on 2016. 12. 19..
//  Copyright © 2016년 Junseok Oh. All rights reserved.
//

import UIKit

class TaskEditViewController: UIViewController {
    
    @IBOutlet
    var titleInput: UITextField!
    @IBOutlet
    var memoInput: UITextView!
    
    var didAddTask: ((Task) -> Void)?
    
    
    @IBAction func cancelButtonDidTap(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonDidTap(){
        guard let title = titleInput.text,
            !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            self.shake(self.titleInput)
            return
        }
        
        
    }
    func shake(_ view: UIView){
        UIView.animate(
            withDuration: 0.05,
            animations: { view.frame.origin.x -= 10 },
            completion: { _ in
                UIView.animate(
                    withDuration: 0.05,
                    animations: { view.frame.origin.x += 20 },
                    completion: { _ in
                        UIView.animate(
                            withDuration: 0.05,
                            animations: { view.frame.origin.x -= 20 },
                            completion: { _ in
                                UIView.animate(
                                    withDuration: 0.05,
                                    animations: { view.frame.origin.x += 20 },
                                    completion: { _ in
                                        UIView.animate(
                                            withDuration: 0.05,
                                            animations: { view.frame.origin.x -= 10 },
                                            completion: { _ in
                                                view.becomeFirstResponder()
                                        })
                                })
                        })
                })
        })
    
    }
}
