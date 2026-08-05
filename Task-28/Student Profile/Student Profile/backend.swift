import Foundation

struct Student: Decodable
{
    let name: String
    let age: Int
    let department: String
    let university: String
    let cgpa: Double
    let city: String
}

func loadData(name: inout String, age: inout String, department: inout String, university: inout String, cgpa: inout String, city: inout String)
{
    guard let jsonData = fakeJsonData.data(using: .utf8)
    else
    {
        return
    }
    do
    {
        let decodedData = try JSONDecoder().decode(Student.self, from: jsonData)
        name = ("\(decodedData.name)")
        age = ("\(decodedData.age)")
        department = ("\(decodedData.department)")
        university = ("\(decodedData.university)")
        cgpa = ("\(decodedData.cgpa)")
        city = ("\(decodedData.city)")
    }
    catch
    {
        print ("\(error)")
    }
}
