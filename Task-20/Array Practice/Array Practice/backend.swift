import Foundation

var fruits: [String] = []

func loadData ()
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode([String].self, from: jsonData)
        fruits = decodedData
    }
    catch
    {
        print ("\(error)")
    }
}
