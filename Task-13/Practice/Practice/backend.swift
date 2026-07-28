import Foundation

struct Mold: Codable
{
    let name: String
    let age: String
}

func loadData(name: inout String, age: inout String)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let item = try JSONDecoder().decode(Mold.self, from: jsonData)
        name = item.name
        age = item.age
    }
    catch
    {
        print ("\(error)")
    }
}
