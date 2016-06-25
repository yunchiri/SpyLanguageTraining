//
//  Question.swift
//  SpyLanguageTraining
//
//  Created by Chilhwan on 2016. 6. 22..
//  Copyright © 2016년 youngchill. All rights reserved.
//

import Foundation
import RealmSwift



class Question: Object {
    dynamic var id = 0
    dynamic var question = ""
    dynamic var answer = ""
    
    dynamic var correct = 0
    dynamic var wrong = 0
    dynamic var solveTime = 0
    
    
    override static func primaryKey() -> String {
        return "id"
    }

    
}

