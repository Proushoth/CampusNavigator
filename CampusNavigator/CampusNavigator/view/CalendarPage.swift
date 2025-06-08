//
//  CalendarPage.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/8/25.
//

import SwiftUI

struct CalendarPage: View {
    var body: some View {
        HStack(spacing: 0){
            ForEach(TabModel.allCases, id: \.rawValue){ tab in
                Button{
                    
                }label:{
                    HStack(spacing: 5){
                        Image(systemName: tab.rawValue)
                    }
                }
                .buttonStyle(.plain)
                
            }
        }
    }
}

#Preview {
    CalendarPage()
}
