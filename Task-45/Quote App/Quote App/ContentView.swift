import SwiftUI

struct ContentView: View
{
    @State var quote: String = "Quote"
    @State var author: String = "Name"
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("Today's Quote")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 35))
                Spacer()
                GroupBox
                {
                    Text (quote)
                        .padding()
                    Text ("\(author)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .glassEffect(in: .rect(cornerRadius: 35))
                Spacer()
                Button (action: {
                    if let newQuote = loadData()
                    {
                        quote = newQuote.text
                        author = newQuote.author
                    }
                })
                {
                    Text ("New Quote")
                }
                .padding()
                .glassEffect(.regular.interactive())
            }
        }
    }
}
#Preview
{
    ContentView()
}
