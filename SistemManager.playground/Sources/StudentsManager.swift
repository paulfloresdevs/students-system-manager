//
//  StudentsManager.swift
//  
//
//  Created by Paul Flores on 30/12/24.
//

import Foundation

public protocol ManegableStudents {
    func insertStudent(_ student: Student)
    func asignSubjectToStudent(subject: Subject, score: Double, student: Student)
    func generateStudentsReport()
    func getApprovedStudents() -> [String]
    func getReprobedStudents() -> [String]
    func getAverages() -> [Double]
    func getTotalAverages() -> Double
    func getCoursedSubjects() -> Set<Subject>
}

public class StudentsManager: ManegableStudents {
    var students: [Student]
    
    public init(students: [Student]) {
        self.students = students
    }
    
    public func insertStudent(_ student: Student) {
        students.append(student)
        print(student.name + " has been added to the list")
    }
    
    public func asignSubjectToStudent(subject: Subject, score: Double, student: Student) {
        
        for studentInList in students {
            if studentInList.email == student.email {
                studentInList.addNewSubject(subject, score)
                print("Student \(student.email) has been assigned \(subject.name)")
            }
        }
    }
    
    public func generateStudentsReport() {
        print("Generating students report...\n")
        
        for student in students {
            print("\(student.describe())")
        }
    }
     // Filter functions
    public func getApprovedStudents() -> [String] {
        print("Generating approved students report...\n")
        
        let approvedStudents = students.filter { student in
            return student.isApproved()
        }
        
        return approvedStudents.reduce(into: [String]()) { result, Student in
            return result.append(Student.name)
        }
    }
    
    public func getReprobedStudents() -> [String] {
        print("Generating reprobed students report...\n")
        
        let reprobedStudents = students.filter { student in
            return !student.isApproved()
        }
        
        return reprobedStudents.reduce(into: [String]()) { result, Student in
            return result.append(Student.name)
        }
    }
    
    // Map functions
    public func getAverages() -> [Double] {
        return students.map { student in
            return student.getAverageScore()
        }
    }
    
    public func getTotalAverages() -> Double {
        let averageList = getAverages()
        let sumOfAverages = averageList.reduce(0.0, +)
        return sumOfAverages / Double(averageList.count)
    }
    
    public func getCoursedSubjects() -> Set<Subject> {
        return students.reduce(into: Set<Subject>()) { result, student in
            for subject in student.subjects {
                result.insert(subject)
            }
        }
    }
}
