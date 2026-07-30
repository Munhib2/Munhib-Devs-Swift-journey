import Foundation

struct TaskItem: Codable
{
    let taskName: String
    let priority: String
    let isCompleted: Bool
}

func loadData (tasks: inout [TaskItem])
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode([TaskItem].self, from: jsonData)
        tasks = decodedData
    }
    catch
    {
        print ("\(error)")
    }
}
