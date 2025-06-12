//
//  Halls.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/12/25.
//

import SwiftUI

struct Halls: View {
    
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Top Navbar
            HomeNavBar()

            // Search Bar
            SearchBar()

            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    Halls()
}

struct SearchBar: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search halls...", text: $search)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
