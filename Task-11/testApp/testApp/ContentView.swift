import SwiftUI

struct ContentView: View {
    // 1. In variables ko tum backend se data lekar update karoge
    @State private var itemTitle: String = ""
    @State private var itemPrice: String = ""
    func loadData()
    {
        guard let jsonData = fakeJSON.data(using: .utf8) else {return}
        do
        {
            let item = try JSONDecoder().decode(Mold.self, from: jsonData)
            itemTitle = item.title
            itemPrice = item.price
        }
        catch
        {
            print ("\(error)")
        }
    }

    var body: some View {
        VStack(spacing: 40) {
            
            // YEH HAI WOH DABBA JIS MEIN DATA DIKHANA HAI
            VStack {
                Text(itemTitle)
                    .font(.headline)
                
                Text(itemPrice)
                    .font(.subheadline)
            }
            .frame(width: 250, height: 100)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            // BUTTON JIS PAR TUM BACKEND RUN KAROGE
            Button(action: {
                loadData()
            }) {
                Text("Load Data")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    ContentView()
}
