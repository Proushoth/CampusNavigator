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

// View for each lecturer row
struct LecturerRow: View {
    let lecturer: Lecturer

    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            Text(lecturer.name)
                .font(.headline)
            Text(lecturer.department)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(lecturer.email)
                .font(.footnote)
                .foregroundColor(.blue)
            Text("Office: \(lecturer.office)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

// Main List View
struct LecturerListView: View {
    var body: some View {
        NavigationStack {
            List(sampleLecturers) { lecturer in
                LecturerRow(lecturer: lecturer)
            }
            .navigationTitle("Lecturers")
        }
    }
}

#Preview {
    LecturerListView()
}
