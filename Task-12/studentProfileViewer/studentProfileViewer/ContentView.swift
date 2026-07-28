import SwiftUI

struct ContentView: View {

    @State private var studentName = ""
    @State private var studentAge = ""
    @State private var department = ""
    @State private var university = ""
    @State private var cgpa = ""
    @State private var city = ""

    var body: some View {

        NavigationView {

            VStack(spacing: 20) {

                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)

                Text(studentName.isEmpty ? "Student Name" : studentName)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(spacing: 15) {

                    InfoRow(title: "Age", value: studentAge)
                    InfoRow(title: "Department", value: department)
                    InfoRow(title: "University", value: university)
                    InfoRow(title: "CGPA", value: cgpa)
                    InfoRow(title: "City", value: city)

                }
                .padding()

                Button {

                    loadData()

                } label: {

                    Text("Load Student Data")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)

                }
                .padding(.horizontal)

                Spacer()

            }
            .padding()
            .navigationTitle("Student Profile")

        }

    }

    func loadData() {

        guard let jsonData = fakeJsonData.data(using: .utf8) else {
            return
        }

        do {

            let student = try JSONDecoder().decode(Student.self, from: jsonData)

            studentName = student.name
            studentAge = String(student.age)
            department = student.department
            university = student.university
            cgpa = String(student.cgpa)
            city = student.city

        } catch {

            print(error)

        }

    }

}

struct InfoRow: View {

    let title: String
    let value: String

    var body: some View {

        HStack {

            Text(title)
                .fontWeight(.semibold)

            Spacer()

            Text(value.isEmpty ? "--" : value)
                .foregroundColor(.gray)

        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)

    }

}

#Preview {
    ContentView()
}
