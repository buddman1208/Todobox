//
//  Task.swift
//  Todobox
//
//  Created by Junseok Oh on 2016. 12. 19..
//  Copyright © 2016년 Junseok Oh. All rights reserved.
//


struct Task {
    var title: String
    var memo: String?
    var done: Bool = false
    
    init(title: String, memo: String? = nil, done: Bool = false){
        self.title = title
        self.memo = memo
        self.done = false
    }
    init?(dictionary: [String:Any]){
        if let title = dictionary["title"] as? String,
            let done = dictionary["done"] as? Bool{
            self.title = title
            self.done = done
            self.memo = dictionary["memo"] as? String
            
        } else {
            return nil
        }
    }
}
