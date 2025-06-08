//
//  ContentView.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                // Welcome Text
                HStack {
                    Text("Campus")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.red)
                    
                    Text("Navigator")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                    
                    
                }
                
                Text("Sign in to access your account and get around campus using the app")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 30)
            Spacer()
        }
    }

#Preview {
    ContentView()
}
