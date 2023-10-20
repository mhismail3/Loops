//
//  NewItemViewViewModel.swift
//  Tasks
//
//  Created by Moose on 10/20/23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {    
    @Published var newLoopText = ""
    @Published var notesText = ""
    @Published var dueDate = Date()
    
    @Published var viewScale: CGFloat = 0.2
    @Published var viewYOffset: CGFloat = 80.0
    @Published var viewOpacity: CGFloat = 0.3
}
