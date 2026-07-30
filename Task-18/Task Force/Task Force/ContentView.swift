import SwiftUI

struct ContentView: View {
    // --- State Variable ---
    // (Aap jab apni alag file mein struct banao ge, toh uska naam 'TaskItem' hi rakhna
    // taake yeh array usko pehchan sake aur errors na aaein)
    @State var tasks: [TaskItem] = []
    
    var body: some View {
        ZStack {
            // Minimal Deep Charcoal Background
            Color(red: 0.08, green: 0.08, blue: 0.10)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                // PREMIUM MINIMAL HEADER
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("WORKSPACE")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(.orange)
                            .tracking(2)
                        Text("Task Protocol")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    // Total tasks count counter
                    Text("\(tasks.count) Active")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.orange)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(6)
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                // TASKS LIST
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        ForEach(tasks, id: \.taskName) { dynamicTask in
                            HStack(spacing: 15) {
                                // Status Indicator Icon (Dynamic change based on Boolean)
                                Image(systemName: dynamicTask.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundColor(dynamicTask.isCompleted ? .green : .white.opacity(0.3))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(dynamicTask.taskName)
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(dynamicTask.isCompleted ? .white.opacity(0.4) : .white)
                                        // Completed tasks par cut line (Strikethrough)
                                        .strikethrough(dynamicTask.isCompleted, color: .white.opacity(0.4))
                                    
                                    Text(dynamicTask.priority)
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(dynamicTask.priority == "Critical" ? .red : .cyan)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .background(Color.white.opacity(0.02))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.04), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                }
                
                // COMPACT COMMAND BUTTON
                Button(action: {
                    loadData(tasks: &tasks)
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("INITIALIZE PROTOCOL")
                    }
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.orange)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
