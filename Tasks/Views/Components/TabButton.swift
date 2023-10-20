//
//  TabButton.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import SwiftUI

struct TabButton: View {
    let imageName: String
    let buttonName: String
    var color: Color = .black
    var buttonWidth: CGFloat = 60
    let action: () -> Void

    var body: some View {        
        Button(action: action) {}
            .buttonStyle(TabButtonStyle(imageName: imageName, buttonName: buttonName, color: color, buttonWidth: buttonWidth))
    }
}

struct TabButton_Previews: PreviewProvider {
    @State static private var imageName = "tray.fill"

    static var previews: some View {
        TabButton(imageName: imageName, buttonName: "Inbox") {
            return
        }
    }
}
