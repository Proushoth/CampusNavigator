//
//  Halls.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/12/25.
//

import SwiftUI

struct Halls: View {
    @State private var selectedSegment = "Lecture"
    let segments = ["Lecture", "Offices", "Events"]
    
    // Sample data for each segment
    let lectureHalls: [(name: String, detail: String, floor: String, equipment: String, status: String)] = [
        ("Hall 101", "Capacity: 120", "Floor 1", "Projector, Whiteboard", "Available"),
        ("Hall 201", "Capacity: 80", "Floor 2", "Projector, Sound System", "In Use"),
        ("Hall 202", "Capacity: 60", "Floor 2", "Whiteboard", "Available"),
        ("Hall 301", "Capacity: 150", "Floor 3", "Projector, Sound System, Video Conferencing", "Maintenance")
    ]
    
    let offices: [(name: String, detail: String, floor: String, department: String, status: String)] = [
        ("Dean's Office", "Room 105", "Floor 1", "Administration", "Open"),
        ("CS Department", "Room 210", "Floor 2", "Computer Science", "Open"),
        ("Admissions", "Room 115", "Floor 1", "Administration", "Closed"),
        ("Faculty Lounge", "Room 305", "Floor 3", "Staff Only", "Open")
    ]
    
    let events: [(name: String, detail: String, time: String, location: String, status: String)] = [
        ("Career Fair", "Annual job fair", "10:00 AM - 4:00 PM", "Main Hall", "Today"),
        ("Guest Lecture", "Dr. Smith on AI", "2:00 PM - 3:30 PM", "Hall 201", "Tomorrow"),
        ("Student Mixer", "Welcome event", "6:00 PM - 8:00 PM", "Cafeteria", "Friday"),
        ("Workshop", "Research Methods", "11:00 AM - 1:00 PM", "Room 302", "Next Week")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top Navbar
                HomeNavBar()
                
                // Search Bar
                SearchBar()
                
                // Segmented Control
                Picker("View", selection: $selectedSegment) {
                    ForEach(segments, id: \.self) { view in
                        Text(view)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom, 12)
                
                // Content based on selection
                Group {
                    if selectedSegment == "Lecture" {
                        List {
                            ForEach(lectureHalls, id: \.name) { hall in
                                HallRow(
                                    title: hall.name,
                                    subtitle: "\(hall.detail) • \(hall.floor)",
                                    detail: hall.equipment,
                                    status: hall.status
                                )
                            }
                        }
                    } else if selectedSegment == "Offices" {
                        List {
                            ForEach(offices, id: \.name) { office in
                                HallRow(
                                    title: office.name,
                                    subtitle: "\(office.detail) • \(office.floor)",
                                    detail: office.department,
                                    status: office.status
                                )
                            }
                        }
                    } else {
                        List {
                            ForEach(events, id: \.name) { event in
                                HallRow(
                                    title: event.name,
                                    subtitle: "\(event.time) • \(event.location)",
                                    detail: event.detail,
                                    status: event.status
                                )
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HallRow: View {
    let title: String
    let subtitle: String
    let detail: String
    let status: String
    
    var statusColor: Color {
        switch status {
        case "Available", "Open":
            return .green
        case "In Use":
            return .orange
        case "Closed", "Maintenance":
            return .red
        case "Today":
            return .blue
        case "Tomorrow":
            return .purple
        default:
            return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text(status)
                    .font(.caption)
                    .foregroundColor(statusColor)
                    .padding(4)
                    .background(statusColor.opacity(0.2))
                    .cornerRadius(4)
            }
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(detail)
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.top, 2)
        }
        .padding(.vertical, 8)
    }
}

struct Halls_Previews: PreviewProvider {
    static var previews: some View {
        Halls()
    }
}

struct SearchBar: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search halls...", text: $search)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
