import SwiftUI

struct Dashboard2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Top Navbar
            HomeNavBar2()

            // Greeting
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, Proushoth")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .padding(.horizontal)

            // Next Class Card
            NextClassCard2()

            // Quick Actions
            QuickActionsView2()

            // Campus Highlights (merged info cards)
            CampusHighlightsView()

            Spacer()
        }
        .padding(.top)
    }
}

struct HomeNavBar2: View {
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

            Image(uiImage: #imageLiteral(resourceName: "notifications"))
                .onTapGesture {
                    // Notification tap action
                }
        }
        .padding(.horizontal)
    }
}

struct NextClassCard2: View {
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
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.9)]),
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct QuickActionsView2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quick Actions")
                .font(.headline)
                .foregroundColor(.brown)
                .padding(.horizontal)

            HStack(spacing: 40) {
                ActionItem2(icon: "calendar", label: "Schedule")
                ActionItem2(icon: "mappin.and.ellipse", label: "Find Building")
                ActionItem2(icon: "magnifyingglass", label: "Ask for Help")
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}

struct ActionItem2: View {
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
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Info Card Section

struct CampusHighlightsView2: View {
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

struct InfoCardView: View {
    var icon: String
    var iconBackground: Color
    var title: String
    var subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(iconBackground)
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.brown)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    Dashboard2()
}
