//
//  Student.swift
//  
//
//  Created by Paul Flores on 30/12/24.
//

import Foundation

public class Student: Describable {
    let name: String
    let age: Int
    let email: String
    var subjects: [Subject]
    var scores: [Double]
    var subjectsPassed: [String] = []
    var subjectsDoesntPass: [String] = []
    
    public init(name: String, age: Int, email: String, subjects: [Subject], scores: [Double]) {
        self.name = name
        self.age = age
        self.email = email
        self.subjects = subjects
        self.scores = scores
    }
    
    public func describe() -> String {
        listOfSubjectsPassed()
        return """
        ---------------------------------------
         Student: \(self.name)               
         Age: \(self.age)                    
         Email: \(self.email)                
         Subjects: \(getSubjectsName())      
         Scores: \(self.scores)
         Average: \(getAverageScore())
         Student Passed: \(isApproved())
        
        Subjects Passed: \(subjectsPassed)
        Subjects Doesn't Passed: \(subjectsDoesntPass)
                                             
        ---------------------------------------
        """
    }
    
    internal func getSubjectsName() -> [String] {
        var subjectsName: [String] = []
        
        
        
        for subject in self.subjects {
            subjectsName.append(subject.name)
        }
        
        return subjectsName
    }
    
    // Minimun 60% of subjects passed
    internal func isApproved() -> Bool {
        let percentageForApprovalSubjects = Double(self.subjects.count) * 0.6
        
        let isStudentApproved: Bool = Double(self.subjectsPassed.count) >= percentageForApprovalSubjects
        
        return isStudentApproved
        
    }
    
    internal func getAverageScore() -> Double {
        var sumOfSubjectScores: Double = 0
        
        for score in self.scores {
            sumOfSubjectScores += score
        }
        
        let averageScore: Double = sumOfSubjectScores / Double(self.subjects.count)
        
        return averageScore
    }
    
    internal func listOfSubjectsPassed() {
        var subjectsPassed: [String] = []
        var subjectsDoesntPass: [String] = []
        
        for number in 0...(self.subjects.count - 1) {
            if self.scores[number] >= self.subjects[number].minimumScore() {
                subjectsPassed.append(self.subjects[number].name)
            } else {
                subjectsDoesntPass.append(self.subjects[number].name)
            }
        }
        self.subjectsPassed = subjectsPassed
        self.subjectsDoesntPass = subjectsDoesntPass
    }
    
    public func addNewSubject(_ subject: Subject, _ score: Double) {
        self.subjects.append(subject)
        self.scores.append(score)
    }
}
