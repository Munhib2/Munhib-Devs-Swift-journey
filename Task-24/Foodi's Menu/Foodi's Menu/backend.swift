import Foundation

struct Menu: Codable
{
    let specialDishes: [String]
    let restaurantName: String
}

var specialDishes: [String] = []
var restaurantName: String = ""

func loadMenuData (menuBool: inout Bool)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Menu.self, from: jsonData)
        menuBool = true
        restaurantName = decodedData.restaurantName
        specialDishes = decodedData.specialDishes
    }
    catch
    {
        print ("\(error)")
    }
}
