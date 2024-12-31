import Foundation

public struct Subject: Describable, Hashable {
    public let name: String
    public let teacherName: String
    public let level: SubjectLevel

    public init(name: String, teacherName: String, level: SubjectLevel) {
        self.name = name
        self.teacherName = teacherName
        self.level = level
    }
    
    public func isPassed(score: Double) -> Bool {
        return score >= minimumScore()
    }
    
    public func describe() -> String {
        return """
            Welcome to the \(name) subject \n 
            Teacher: \(teacherName) \n
            Score to pass: \(minimumScore())
        """
    }
    
    public func minimumScore() -> Double {
        switch level {
        case SubjectLevel.basic:
            return 50
        case SubjectLevel.intermediate:
            return 75
        case SubjectLevel.advanced:
            return 90
        }
    }
}
    
