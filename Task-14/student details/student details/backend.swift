import Foundation

struct Student: Codable
{
    let name: String
    let age: Int
    let cgpa: Double
    let semester: String
}

func loadData(name: inout String, age: inout Int, cgpa: inout Double, semester: inout String)
{
    guard let jsonData = fakeJson.data(using: .utf8) else {return}
    do
    {
        let person = try JSONDecoder().decode(Student.self, from: jsonData)
        
        name = person.name
        age = person.age
        cgpa = person.cgpa
        semester = person.semester
    }
    catch
    {
        print ("\(error)")
    }
}
