//
//  Dashboard.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/11/25.
//

import SwiftUI

struct Dashboard: View {
    @State private var selectedAction: QuickAction? = nil

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                HomeNavBar()

                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello, Proushoth!")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .padding(.horizontal)

                NextClassCard()

                QuickActionsView(selectedAction: $selectedAction)

                CampusHighlightsView()

                Spacer()
            }
            .padding(.top)
            
            .navigationDestination(for: QuickAction.self) { action in
                switch action {
                case .schedule:
                    CalendarTaskView()
                case .findBuilding:
                    CampusMapView()
                case .help:
                    ProfileSetupView()
                }
            }
        }
    }
}

enum QuickAction: Hashable {
    case schedule
    case findBuilding
    case help
}


struct HomeNavBar: View {
    var body: some View {
        HStack {
            HStack {
                Text("Campus")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.red)
                Text("Navigator")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.black)
            }
            
            Spacer()
            NavigationLink {
                NotificationView()
            } label: {
                Image(uiImage: #imageLiteral(resourceName: "notifications"))
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

struct NextClassCard: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: "calendar")
                .font(.system(size: 24))
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 4) {
                Text("Next Class")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)

                Text("Computer Science 101")
                    .font(.headline)
                    .foregroundColor(.white)

                Text("10:00 AM • Hall A2 • 5 min walk")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
            }

            Spacer()

            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.red.opacity(0.9)]),
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct QuickActionsView: View {
    @Binding var selectedAction: QuickAction?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quick Actions")
                .font(.headline)
                .foregroundColor(.brown)
                .padding(.horizontal)

            HStack(spacing: 40) {
                NavigationLink(value: QuickAction.schedule) {
                    ActionItem(icon: "calendar", label: "Schedule")
                }

                NavigationLink(value: QuickAction.findBuilding) {
                    ActionItem(icon: "mappin.and.ellipse", label: "Find Building")
                }

                NavigationLink(value: QuickAction.help) {
                    ActionItem(icon: "person", label: "Profile")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}

    



struct ActionItem: View {
    let icon: String
    let label: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.brown)
        }
    }
}

struct CampusHighlightsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Campus Highlights")
                .font(.headline)
                .foregroundColor(.brown)
                .padding(.horizontal)

            VStack(spacing: 16) {
            NavigationLink {
                LibraryView()
            } label: {
                InfoCardView(
                    icon: "house.fill",
                    iconBackground: .green,
                    title: "Library Quiet Zones",
                    subtitle: "Moderate occupancy · Level 2 available"
                )
            }
            .buttonStyle(.plain)

            NavigationLink {
                    CanteenView()
            } label: {
                InfoCardView(
                    icon: "person.2.fill",
                    iconBackground: .orange,
                    title: "Student Cafeteria",
                    subtitle: "Busy · Wait time ~15 min"
                )
            }
            .buttonStyle(.plain)

            NavigationLink {
                Event(
                    eventName: "Fresher Party",
                    building: Building(name: "Main Auditorium", x: 150, y: 180, width: 80, height: 80),
                        time: "6:00 PM - 9:30 PM",
                    description: "Join us for the annual Fresher Party to welcome the new batch of students! Enjoy an evening filled with music, dance, games, and refreshments. This is a great opportunity to meet your peers and make new friends. Don’t forget to bring your college ID.",
                directions: [
                                "Enter through the gate of the campus",
                                "Walk straight towards the programme office",
                                "Turn right at the canteen",
                                "The Main Auditorium will be directly ahead"
                            ],
                            status: "Today"
                        )
                } label: {
                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
            }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Dashboard()
}
