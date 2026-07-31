import Foundation

var myFruits: [String] = []

func loadFruitsData() {
    guard let jsonData = fakeJsonData.data(using: .utf8) else { return }
    
    do {
        let decodedFruits = try JSONDecoder().decode([String].self, from: jsonData)
        
        myFruits = decodedFruits
        print("Data Loaded Successfully!")
    } catch {
        print("Error decoding: \(error)")
    }
}
