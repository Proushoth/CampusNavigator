import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
}

struct CalendarToDoView: View {
    @State private var selectedDate = Date()
    @State private var taskTitle = ""
    @State private var tasks: [Task] = []

    // Filter tasks by selected date (ignoring time)
    var filteredTasks: [Task] {
        tasks.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HStack {
                    Text("Campus")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.red)

                    Text("Navigator")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 30)


                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                HStack {
                    TextField("Enter task", text: $taskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)

                List {
                    if filteredTasks.isEmpty {
                        Text("No tasks for this date.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(filteredTasks) { task in
                            Text(task.title)
                        }
                        .onDelete(perform: deleteTask)
                    }
                }
            }
        }
        
    }
       
    func addTask() {
        guard !taskTitle.isEmpty else { return }
        let newTask = Task(title: taskTitle, date: selectedDate)
        tasks.append(newTask)
        taskTitle = ""
    }

    func deleteTask(at offsets: IndexSet) {
        let allTasksForDate = filteredTasks
        for index in offsets {
            if let realIndex = tasks.firstIndex(where: { $0.id == allTasksForDate[index].id }) {
                tasks.remove(at: realIndex)
            }
        }
    }
}

struct CalendarToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarToDoView()
    }
}
