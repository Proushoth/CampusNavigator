//
//  ContentView.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/7/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                
                
                }
            
            Text("Search")
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                
                }
            
            Text("Home")
                .tabItem{
                    Image(systemName: "gear")
                    Text("Search")
                  
                }
            
                .tint(.red) 
        }
    }
    }

#Preview {
    ContentView()
}
