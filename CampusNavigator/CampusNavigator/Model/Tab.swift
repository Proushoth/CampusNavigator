//
//  Tab.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/8/25.
//

import SwiftUI

enum TabModel: String, CaseIterable{
    case home = "house"
    case search = "magnifyingglass"
    case notification = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home : "house"
        case .search : "magnifyingglass"
        case .notification : "bell"
        case .settings : "gearshape"
        }
    }
}
