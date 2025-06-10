//
//  NotificationsPage.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/10/25.
//

import SwiftUI

// MARK: - Notification Model
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let date: Date
}

// MARK: - Main View
struct NotificationListView: View {
    @State private var notifications: [NotificationItem] = [
        NotificationItem(title: "Assignment Due", message: "Submit your Data Structures assignment by tonight.", date: Date()),
        NotificationItem(title: "Event Reminder", message: "Campus Fest starts at 6 PM in the Main Hall.", date: Date()),
        NotificationItem(title: "New Grades", message: "Your test results are available on the portal.", date: Date()),
        NotificationItem(title: "Library Alert", message: "Return overdue books to avoid fines.", date: Date()),
        NotificationItem(title: "Maintenance", message: "Server maintenance scheduled for tomorrow 2 AM.", date: Date())
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Header
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
            
            // MARK: - Notifications List
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(notifications) { notification in
                        NotificationCard(notification: notification)
                            .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
            ContentView()
            
        }
    
    }
}

// MARK: - Notification Card UI
struct NotificationCard: View {
    let notification: NotificationItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(notification.title)
                .font(.headline)
                .foregroundColor(.blue)
            Text(notification.message)
                .font(.body)
                .foregroundColor(.primary)
            Text(notification.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity) // 👈 Ensures equal width
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}


// MARK: - Preview
struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
