//
//  TabBarViewModel.swift
//  Tasks
//
//  Created by Moose on 10/20/23.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var firstVStackHeight: CGFloat = 0
    @Published var firstVStackWidth: CGFloat = 0
    @Published var highlightColor: Color = .gray
    @Published var highlightXOffset: CGFloat = 0
}
