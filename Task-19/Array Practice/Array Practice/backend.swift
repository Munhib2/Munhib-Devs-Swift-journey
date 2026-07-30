import Foundation

var myTasks: [String] = []

func loadData ()
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode([String].self, from: jsonData)
        myTasks = decodedData
    }
    catch
    {
        print ("\(error)")
    }
}
