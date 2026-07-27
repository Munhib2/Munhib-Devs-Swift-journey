import Foundation

struct Coin: Codable
{
    let name: String
    let symbol: String
    let price: Double
    let changePercentage: Double
    let holdQuantity: Double
}

struct PortfolioManager: Codable
{
    var coinList: [Coin] = [
        Coin (name: "Bitcoin", symbol: "BTC", price: 64250.0, changePercentage: 2.45, holdQuantity: 0.5),
        Coin (name: "Ethereum", symbol: "ETH", price: 3450.25, changePercentage: -1.20, holdQuantity: 2.0),
        Coin (name: "Solana", symbol: "SOL", price: 145.80, changePercentage: 5.67, holdQuantity: 0.0),
        Coin (name: "Cardano", symbol: "ADA", price: 0.48, changePercentage: -0.50, holdQuantity: 0.0)
    ]
    
    func calTotalBalance() -> Double
    {
        var total = 0.0
        for i in coinList
        {
            total += i.price * i.holdQuantity
        }
        return total
    }
}
