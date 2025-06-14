//
//  Event.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-14.
//

import SwiftUI

struct Event: View {
    let eventName: String
    let building: Building
    let time: String
    let description: String
    let directions: [String]
    let status: String
    
    var statusColor: Color {
        switch status {
        case "Today": return .blue
        case "Tomorrow": return .purple
        case "Upcoming": return .orange
        case "Completed": return .gray
        default: return .green
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.purple.opacity(0.2))
                            .frame(height: 240)
                            .overlay(
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.purple.opacity(0.5)))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.purple, lineWidth: 3)
                            )
                            .overlay(
                                Image(systemName: "party.popper.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.purple)
                            )
                            .offset(y: 65)
                    }
                    .padding(.bottom, 65)
                    .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(eventName)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Label(building.name, systemImage: "building.columns")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                                
                                Label("June 14, 2025", systemImage: "calendar")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // New Time and Status Card
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .stroke(Color(.systemGray4), lineWidth: 1)
                            .frame(height: 80)
                            .overlay(
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text("Time")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Text(time)
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.primary)
                                    }
                                    
                                    HStack {
                                        Text("Status")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Text(status)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 4)
                                            .background(
                                                Capsule()
                                                    .fill(statusColor)
                                            )
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            )
                            .padding(.horizontal, 20)
                        
                        Divider()
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("About the Event")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            Text(description)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.secondary)
                                .lineSpacing(4)
                        }
                        .padding(.horizontal, 20)
                        
                        Divider()
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Directions to Event Location")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(directions, id: \.self) { direction in
                                    HStack(alignment: .top, spacing: 12) {
                                        Image(systemName: "arrow.turn.up.right")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.purple)
                                            .frame(width: 24, height: 24)
                                            .background(Circle().fill(Color.purple.opacity(0.2)))
                                        
                                        Text(direction)
                                            .font(.system(size: 16, weight: .regular))
                                            .foregroundColor(.secondary)
                                            .lineSpacing(4)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }
                .navigationTitle(eventName)
            }
            .background(Color(.systemGroupedBackground))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Event_Previews: PreviewProvider {
    static var previews: some View {
        Event(
            eventName: "Career Fair",
            building: Building(name: "Student Center", x: 220, y: 200, width: 60, height: 60),
            time: "10:00 AM - 4:00 PM",
            description: "Annual job fair featuring top companies from various industries. Open to all students and alumni. Bring multiple copies of your resume and dress professionally.",
            directions: [
                "Enter through the main doors of the Student Center",
                "Walk straight past the information desk",
                "Take the escalator to the second floor",
                "The event will be in the Grand Ballroom on your right"
            ],
            status: "Today"
        )
    }
}
