//
//  HomeViewViewModel.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var tabBarYOffSet: CGFloat = 100
    @Published var previousTab: Int = 0
    @Published var selectedTab: Int = 0
    @Published var showPopup: Bool = false
    @Published var showSettings: Bool = false
    @Published var pageTitle: String = ""
    @Published var titleForegroundColor: Color = .black
}
