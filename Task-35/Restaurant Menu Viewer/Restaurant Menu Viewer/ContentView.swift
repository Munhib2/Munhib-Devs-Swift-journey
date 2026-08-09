import SwiftUI

struct ContentView: View {
    
    @State var restaurantName: String = "Restaurant"
    @State var city: String = "City"
    @State var area: String = "Area"
    @State var categories: [Categories] = []
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(restaurantName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("\(city), \(area)")
                        .foregroundColor(.gray)
                    
                    ForEach(categories, id: \.name) { category in
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(category.name)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                            ForEach(category.items, id: \.name) { item in
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .foregroundColor(.white)
                                        
                                        Text("Rs. \(item.price)")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.isAvailable ? "Available" : "Unavailable")
                                        .font(.caption)
                                        .foregroundColor(
                                            item.isAvailable ? .green : .red
                                        )
                                }
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                            }
                        }
                    }
                    
                    Button("Load Menu") {
                         loadData (name: &restaurantName, city: &city, area: &area, categories: &categories)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
