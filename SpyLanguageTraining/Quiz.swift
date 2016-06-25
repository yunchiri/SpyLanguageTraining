//
//  Quiz.swift
//  SpyLanguageTraining
//
//  Created by Chilhwan on 2016. 6. 22..
//  Copyright © 2016년 youngchill. All rights reserved.
//

import Foundation
import RealmSwift


class Quiz {
    var question : Question
    var answer : String
    var isCorrect : Bool = false
    
    let maxSolveTime = 4000
    let minSolveTime = 1000
    var startTime = ""
    var endTime = ""
    
    
    func markQuiz(isCorrect : Bool) -> Bool {
        if self.isCorrect == isCorrect {
            return true
        }
        else{
            return false
        }
    }
    
    func makeQuiz() {
        let correct = Int(arc4random_uniform(1))
        
        if correct == 1 {
            isCorrect = true
            answer = question.answer
        }else{
            isCorrect = false
            answer = getWrongAnswerWithoutQuestionID( question.id )
        }
        
    }
    
    func limitTime(correct : Int) -> Int{
        return 1
    }
    
    
    
    private func getWrongAnswerWithoutQuestionID(questionID : Int) -> String{
        //let questions = realm.objects(Question)
        // let newId = arc4random_uniform( questions.count)
        
        
        let newId = getRandomIDWithoutQuestionID(questionID)
        let realm = try! Realm()
        let wrongQuestion =  realm.objects(Question.self).filter("id == " + String(newId)).first!
        
        return wrongQuestion.answer
        
    }
    
    private func getRandomIDWithoutQuestionID(questionID: Int) -> Int{
        let questionsCount : UInt32 = 500
        
        while true {
            let randomID =  arc4random_uniform(questionsCount)
            if questionID != Int(randomID) {
                return Int(randomID)
            }
        }
        
    }
    
    func correct(){
        dispatch_async(dispatch_queue_create("background", nil)) {
            let realm = try! Realm()
            try! realm.write {
                if endTime - startTime >
                self.questions.solveTime = max(endTime - startTime , minSolveTime)
                self.question.correct = self.question.correct + 1
            }
        }
        
        func wrong(){
            dispatch_async(dispatch_queue_create("background", nil)) {
                let realm = try! Realm()
                try! realm.write {
                    self.question.solveTime = max(endTime - startTime, minSolveTime)
                    self.question.wrong = self.question.wrong + 1
                }      
            }
            
            
}


