import SwiftUI

struct ContentView: View
{
    @State var name: String = "loading..."
    @State var age: String = "loading..."
    @State var department: String = "loading..."
    @State var university: String = "loading..."
    @State var cgpa: String = "loading..."
    @State var city: String = "loading..."
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("Student Profile")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 45))
                Spacer()
                HStack
                {
                    Text ("Student Name:")
                        .foregroundColor(.white)
                        .bold()
                    Text ("\(name)")
                        .foregroundColor(.white)
                }
                Spacer()
                GroupBox
                {
                    VStack
                    {
                        HStack
                        {
                            Text ("Age:")
                                .padding()
                            Text ("\(age)")
                                .padding()
                        }
                        HStack
                        {
                            Text ("Department:")
                                .padding()
                            Text ("\(department)")
                                .padding()
                        }
                        HStack
                        {
                            Text ("University:")
                                .padding()
                            Text ("\(university)")
                                .padding()
                        }
                        HStack
                        {
                            Text ("CGPA:")
                                .padding()
                            Text ("\(cgpa)")
                                .padding()
                        }
                        HStack
                        {
                            Text ("City:")
                                .padding()
                            Text ("\(city)")
                                .padding()
                        }
                    }
                }
                .cornerRadius(20)
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 50))
                .padding()
                Spacer()
                Button(action: {
                    loadData(name: &name, age: &age, department: &department, university: &university, cgpa: &cgpa, city: &city)
                })
                {
                    Text ("Load Student Data")
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
