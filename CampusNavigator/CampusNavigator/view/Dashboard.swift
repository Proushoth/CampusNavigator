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
            // Navigation destination based on enum value
            .navigationDestination(for: QuickAction.self) { action in
                switch action {
                case .schedule:
                    CalendarToDoView()
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
    }
}

struct NextClassCard: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            // Calendar Icon
            Image(systemName: "calendar")
                .font(.system(size: 24))
                .foregroundColor(.white)

            // Text Content
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

            // Chevron
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
                    ActionItem(icon: "magnifyingglass", label: "Ask for Help")
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
                InfoCardView(
                    icon: "house.fill",
                    iconBackground: .green,
                    title: "Library Quiet Zones",
                    subtitle: "Moderate occupancy · Level 2 available"
                )

                InfoCardView(
                    icon: "person.2.fill",
                    iconBackground: .orange,
                    title: "Student Cafeteria",
                    subtitle: "Busy · Wait time ~15 min"
                )

                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    Dashboard()
}
