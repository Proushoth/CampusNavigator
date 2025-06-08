import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case settings = "gear"
}

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack {
            Spacer()
            // Display content based on selected tab
            Group {
                switch selectedTab {
                case .home:
                    Text("Home View")
                case .search:
                    Text("Search View")
                case .settings:
                    Text("Settings View")
                }
            }

            Spacer()

            // Custom Tab Bar
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack {
                            Image(systemName: tab.rawValue)
                                .font(.system(size: 22))
                                .foregroundColor(selectedTab == tab ? .red : .gray)
                            Text(tab.rawValue.capitalized)
                                .font(.caption)
                                .foregroundColor(selectedTab == tab ? .red : .gray)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 12)
            .background(Color(.systemBackground).shadow(radius: 2))
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
