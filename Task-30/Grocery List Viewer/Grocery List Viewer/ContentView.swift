import SwiftUI

struct ContentView: View
{
    @State var items: [Product] = []
    @State var storeName: String = "loading..."
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("🛒 Grocery List")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 40))
                Spacer()
                ForEach(items)
                {
                    item in
                    GroupBox
                    {
                        VStack
                        {
                            Text ("\(item.name)")
                                .bold()
                                .font(.system(size: 25))
                                .padding()
                            HStack
                            {
                                Text ("Quantity:")
                                    .padding()
                                Text ("\(item.quantity)")
                                    .padding()
                            }
                        }
                    }
                    .background(Color.gray)
                    .glassEffect(in: .rect(cornerRadius: 30))
                    .padding()
                }
    
                Spacer()
                
                Button (action: {
                    loadData(storeName: &storeName, items: &items)
                })
                {
                    Text ("Load Items")
                }
                .padding()
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 10))
            }
        }
    }
}
#Preview
{
    ContentView()
}
