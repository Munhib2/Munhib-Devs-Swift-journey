import Foundation

struct PizzaDetail: Codable
{
    let pizza_name: String
    let price: Int
    let is_available: Bool
}

func testMyPizzaCode()
{
    let fakeServertext = """
    {
        "pizza_name": "Chicken Tikka",
        "price": 1250,
        "is_available": true
    }
    """
    guard let jsonData = fakeServertext.data(using: .utf8) else {return}
    let decoder = JSONDecoder()
    do
    {
        let pizza = try decoder.decode(PizzaDetail.self, from: jsonData)
        print ("Success! Pizza Name: \(pizza.pizza_name)")
        print ("Price: \(pizza.price)")
    }
    catch
    {
        print ("Data didn't matched: \(error)")
    }
}
