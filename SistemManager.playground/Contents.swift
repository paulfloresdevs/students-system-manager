import Foundation

let math = Subject(name: "Math", teacherName: "Mr. Smith", level: SubjectLevel.advanced)
let science = Subject(name: "Science", teacherName: "Mr. Jones", level: SubjectLevel.intermediate)
let history = Subject(name: "History", teacherName: "Mr. Brown", level: SubjectLevel.basic)

let johnStudent =
    Student(
        name: "John",
        age: 23,
        email: "john@mail.com",
        subjects: [],
        scores: []
    )

let janeStudent =
AdvancedStudent(
    extraPoints: 50,
    name: "Jane",
    age: 24,
    email: "jane@mail.com",
    subjects: [],
    scores: []
)


// StudentManagerFunctions
var manager = StudentsManager.init(students: [])

// Insert Student
print("\n Insert Students \n")
manager.insertStudent(johnStudent)
manager.insertStudent(janeStudent)

// Asign Subjects
print("\n Asign Subjects to Students \n")
manager.asignSubjectToStudent(subject: math, score: 70, student: johnStudent)
manager.asignSubjectToStudent(subject: science, score: 60, student: johnStudent)
manager.asignSubjectToStudent(subject: history, score: 80, student: johnStudent)

manager.asignSubjectToStudent(subject: math, score: 70, student: janeStudent)
manager.asignSubjectToStudent(subject: science, score: 60, student: janeStudent)
manager.asignSubjectToStudent(subject: history, score: 80, student: janeStudent)

// Coursed Subjects
print("\n Get Coursed Subjects \n")
print(manager.getCoursedSubjects())

// Approved and not approved Students
print("\n Get Approved and not approved Students \n")
print(manager.getApprovedStudents())
print(manager.getReprobedStudents())

// Average
print("\n Get Average \n")
print(manager.getAverages())

// Students Report
print("\n Generate Students Report \n")
manager.generateStudentsReport()


