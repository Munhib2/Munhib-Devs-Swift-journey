import SwiftUI
struct ContentView: View
{
    @State var name = "_______"
    @State var age = 0
    @State var cgpa = 0.0
    @State var semester = "_______"
    var body: some View
    {
        ZStack
        {
            Color.gray
                .ignoresSafeArea()
            VStack
            {
                Text ("Student Portal")
                    .font(.system(size: 40))
                    .bold()
                    .padding(.top, 30)
                Spacer()
                GroupBox
                {
                    HStack
                    {
                        Text ("Name:")
                            .bold()
                            .frame(maxWidth: .infinity)
                        Text ("\(name)")
                            .frame(maxWidth: .infinity)
                    }
                }
                .cornerRadius(20)
                .padding()
                GroupBox
                {
                    HStack
                    {
                        Text ("Age:")
                            .bold()
                            .frame(maxWidth: .infinity)
                        Text ("\(age)")
                            .frame(maxWidth: .infinity)
                    }
                }
                .cornerRadius(20)
                .padding()
                GroupBox
                {
                    HStack
                    {
                        Text ("CGPA:")
                            .bold()
                            .frame(maxWidth: .infinity)
                        Text (String(format: "%.2f", cgpa))
                            .frame(maxWidth: .infinity)
                    }
                }
                .cornerRadius(20)
                .padding()
                GroupBox
                {
                    HStack
                    {
                        Text ("Semester:")
                            .bold()
                            .frame(maxWidth: .infinity)
                        Text ("\(semester)")
                            .frame(maxWidth: .infinity)
                    }
                }
                .cornerRadius(20)
                .padding()
                Spacer()
                
                Button (action: {
                    loadData(name: &name, age: &age, cgpa: &cgpa, semester: &semester)
                })
                {
                    Text ("Load Data")
                }
                .padding()
                .buttonStyle(.glass)
                .tint(.green)
                .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 0)
            }
        }
    }
}
#Preview {
    ContentView()
}
