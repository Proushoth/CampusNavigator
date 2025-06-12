import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {
            
        
            Dashboard()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            Halls()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            CalendarToDoView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                .tag(2)
            
            ProfileSetupView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
        .accentColor(.red)
    }
}

#Preview {
    ContentView()
}
