import SwiftUI

struct TaskEvent: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let color: Color
}

struct CalendarTaskView: View {
    @State private var selectedDateIndex = 0

    let days = ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"]
    let dates = [20, 21, 22, 23, 24, 25, 26]

    let eventsPerDay: [Int: [TaskEvent]] = [
        0: [TaskEvent(title: "CS101 Lecture", location: "Room A201", time: "09:00 AM", color: .blue),
            TaskEvent(title: "Math Club Meetup", location: "Room B105", time: "04:00 PM", color: .green)],
        
        1: [TaskEvent(title: "Freshers party", location: "Auditorium", time: "10:00 AM", color: .purple),
            TaskEvent(title: "Drama Club flash mob", location: "Third floor", time: "06:00 PM", color: .orange)],
        
        2: [TaskEvent(title: "Library Book sale", location: "Hall 309", time: "02:00 PM", color: .teal)],
        
        3: [TaskEvent(title: "Engineering induction", location: "Harrison hall", time: "11:00 AM", color: .indigo),
            TaskEvent(title: "Basketball Practice", location: "Sports Arena", time: "05:30 PM", color: .red)],
        
        4: [TaskEvent(title: "AI & Ethics Lecture", location: "Lecture Hall D", time: "01:00 PM", color: .pink)],
        
        5: [TaskEvent(title: "Group Project Meeting", location: "Library Basement", time: "03:00 PM", color: .cyan),
            TaskEvent(title: "Movie Night", location: "Open Air Theatre", time: "07:00 PM", color: .purple)],
        
        6: [TaskEvent(title: "Hackathon", location: "Mac Lab", time: "08:00 AM", color: .mint),
            TaskEvent(title: "Music Fest", location: "Campus Grounds", time: "06:00 PM", color: .yellow)]
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Calendar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding(.horizontal)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<days.count, id: \.self) { index in
                        VStack(spacing: 8) {
                            Text(days[index])
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text("\(dates[index])")
                                .font(.headline)
                                .foregroundColor(selectedDateIndex == index ? .white : .primary)
                                .padding(10)
                                .background(
                                    Circle()
                                        .fill(selectedDateIndex == index ? Color.black : Color.clear)
                                )
                        }
                        .onTapGesture {
                            selectedDateIndex = index
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }

            
            if let events = eventsPerDay[selectedDateIndex] {
                ForEach(events) { event in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(event.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Spacer()
                            HStack(spacing: 4) {
                                Image(systemName: "clock")
                                Text(event.time)
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }

                        Text(event.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(event.color.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
            } else {
                Text("No events for this day.")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top, 20)
            }

            Spacer()

        
        }
    }
}

struct CalendarTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTaskView()
    }
}
