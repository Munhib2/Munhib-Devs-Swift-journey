import Foundation

struct Store: Decodable
{
    let storeName: String
    let items: [Product]
}
struct Product: Decodable, Identifiable
{
    let id = UUID()
    let name: String
    let quantity: Int
}

func loadData(storeName: inout String, items: inout [Product])
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Store.self, from: jsonData)
        storeName = decodedData.storeName
        items = decodedData.items
    }
    catch
    {
        print ("\(error)")
    }
}
