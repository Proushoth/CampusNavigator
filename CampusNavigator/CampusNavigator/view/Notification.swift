//
//  Notification.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/12/25.
//

import SwiftUI

struct NotificationView: View {
    @State private var selectedFilter = 0
    let filters = ["All", "Unread", "Location", "Social", "Events"]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Header
                HStack {
                    Text("Notifications")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button("Mark all read") {
                        // Handle action
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                .padding(.horizontal)

                Text("3 unread notifications")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                // Filter Segments
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<filters.count, id: \.self) { index in
                            Text(filters[index])
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(selectedFilter == index ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                                .foregroundColor(selectedFilter == index ? .blue : .gray)
                                .cornerRadius(16)
                                .onTapGesture {
                                    selectedFilter = index
                                }
                        }
                    }
                    .padding(.horizontal)
                }

                Divider()

                // Notification List
                List {
                    NotificationRow(icon: "location.circle.fill", title: "You've arrived at Camp Wilderness", subtitle: "Welcome to Camp Wilderness! Check in at the main office to get your cabin assignment.", time: "2 min ago", iconColor: .blue)
                    
                    NotificationRow(icon: "person.crop.circle.badge.plus", title: "New friend request", subtitle: "Sarah Johnson wants to connect with you. She's staying in Cabin 12.", time: "15 min ago", iconColor: .green)
                    
                    NotificationRow(icon: "calendar", title: "Campfire tonight at 8 PM", subtitle: "Join us for stories, s'mores, and songs around the campfire at the main fire pit.", time: "1 hour ago", iconColor: .orange)

                    NotificationRow(icon: "location.circle", title: "Trail recommendation", subtitle: "We recommend the Pine Ridge Trail for your morning hike.", time: "3 hours ago", iconColor: .blue)
                    
                    NotificationRow(icon: "bell", title: "Weather update", subtitle: "Light rain expected this afternoon. Don't forget to bring a jacket.", time: "5 hours ago", iconColor: .gray)
                    
                    NotificationRow(icon: "person.2.fill", title: "Group activity invitation", subtitle: "Mike's group is organizing a volleyball game at 3 PM. Want to join?", time: "Yesterday", iconColor: .green)
                }
                .listStyle(.plain)
            }
            .navigationBarHidden(true)
        }
    }
}

struct NotificationRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let time: String
    let iconColor: Color

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .font(.system(size: 20))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(time)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NotificationView()
}
