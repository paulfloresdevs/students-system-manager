 //
//  AdvancedStudent.swift
//  
//
//  Created by Paul Flores on 30/12/24.
//

import Foundation

public class AdvancedStudent: Student {
    let extraPoints: Int
    
    public init(extraPoints: Int, name: String, age: Int, email: String, subjects: [Subject], scores: [Double]) {
        self.extraPoints = extraPoints
        super.init(name: name, age: age, email: email, subjects: subjects, scores: scores)
    }
    
    public override func describe() -> String {
        listOfSubjectsPassed()

        return """
        ---------------------------------------
                                             
         Student: \(self.name)               
         Age: \(self.age)                    
         email: \(self.email)                
         subjects: \(super.getSubjectsName())      
         scores: \(self.scores)
         extra points: \(self.extraPoints)
         Average: \(super.getAverageScore())
         Student Passed: \(super.isApproved())
        
         Subjects Passed: \(subjectsPassed)
         Subjects Doesn't Passed: \(subjectsDoesntPass)
                                             
        ---------------------------------------
        """
    }
}
