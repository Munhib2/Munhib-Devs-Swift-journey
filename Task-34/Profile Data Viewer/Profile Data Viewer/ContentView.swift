import SwiftUI

struct ContentView: View
{
    @State var name: String = "Loading..."
    @State var username: String = "Loading..."
    @State var age: String = "Loading..."
    @State var bio: String = "Loading..."
    @State var location: String = "Loading..."
    @State var website: String? = nil

    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 20)
            {
                Text("👤")
                    .font(.system(size: 70))

                Text(name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()

                Text("@\(username)")
                    .foregroundColor(.gray)
                    .font(.title3)

                GroupBox
                {
                    VStack(alignment: .leading, spacing: 12)
                    {
                        HStack
                        {
                            Text("Age:")
                            Spacer()
                            Text ("\(age)")
                        }
                        .padding()
                        HStack
                        {
                            Text("Bio:")
                            Spacer()
                            Text ("\(bio)")
                        }
                        .padding()
                        HStack
                        {
                            Text("Location:")
                            Spacer()
                            Text ("\(location)")
                        }
                        .padding()
                        HStack
                        {
                            Text("Website:")
                            Spacer()
                            Text ("\(website)")
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .cornerRadius(15)

                Spacer()

                Button(action: {
                    loadData(
                        name: &name,
                        username: &username,
                        age: &age,
                        bio: &bio,
                        location: &location,
                        website: &website
                    )
                })
                {
                    Text("Load Profile")
                }
                .padding()
                .glassEffect(.regular.interactive())
            }
            .padding()
        }
    }
}

#Preview
{
    ContentView()
}
