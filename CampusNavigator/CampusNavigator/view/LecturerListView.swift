//
//  LecturerListView.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/14/25.
//

import SwiftUI

// Model for Lecturer
struct Lecturer: Identifiable {
    let id = UUID()
    let name: String
    let department: String
    let email: String
    let office: String
}

// Sample data
let sampleLecturers = [
    Lecturer(name: "Dr. Alice Johnson", department: "Computer Science", email: "alice@university.edu", office: "Room 301"),
    Lecturer(name: "Prof. Mark Lee", department: "Mathematics", email: "mark@university.edu", office: "Room 205"),
    Lecturer(name: "Dr. Sarah Kim", department: "Physics", email: "sarah@university.edu", office: "Room 110"),
    Lecturer(name: "Dr. David Wong", department: "Biology", email: "david@university.edu", office: "Room 420")
]

/// Main List View
struct LecturerListView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {  // Remove spacing between navbar and list
                HomeNavBar()
                
                List {
                    ForEach(sampleLecturers) { lecturer in
                        LecturerRow(lecturer: lecturer)
                            .listRowInsets(EdgeInsets()) // Remove default padding
                            .listRowSeparator(.hidden) // Hide separator if desired
                    }
                }
                .listStyle(.plain) // Use plain list style
            }
        }
    }
}

struct LecturerRow: View {
    let lecturer: Lecturer
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lecturer.name)
                    .font(.headline)
                Text(lecturer.department)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(lecturer.email)
                    .font(.footnote)
                    .foregroundColor(.red)
                Text("Office: \(lecturer.office)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal) // Add horizontal padding instead of using list's default
        .frame(maxWidth: .infinity, alignment: .leading) // Stretch horizontally
    }
}


#Preview {
    LecturerListView()
}
