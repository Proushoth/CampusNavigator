//
//  Docker.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-13.
//

import SwiftUI

struct Docker: View {
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
            
            CalendarTaskView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                .tag(2)
            
            LecturerListView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Contact")
                }
                .tag(3)
        }
        .accentColor(.red)
    }
}

#Preview {
    Docker()
}
