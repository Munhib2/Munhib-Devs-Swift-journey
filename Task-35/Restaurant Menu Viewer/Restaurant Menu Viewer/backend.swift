import Foundation

struct Menu: Decodable
{
    let restaurant: String
    let location: Location
    let categories: [Categories]
}

struct Location: Decodable
{
    let city: String
    let area: String
}
struct Categories: Decodable
{
    let name: String
    let items: [Items]
}
struct Items: Decodable
{
    let name: String
    let price: Int
    let isAvailable: Bool
}

func loadData (name: inout String, city: inout String, area: inout String, categories: inout [Categories])
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Menu.self, from: jsonData)
        name = decodedData.restaurant
        city = decodedData.location.city
        area = decodedData.location.area
        categories = decodedData.categories
    }
    catch
    {
        print ("Munhib bro error aya hy: \(error)")
    }
}
