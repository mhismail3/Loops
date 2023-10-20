//
//  ButtonStyles.swift
//  Tasks
//
//  Created by Moose on 10/20/23.
//

import Foundation
import SwiftUI

struct LoginButtonStyle: ButtonStyle {
    var containerWidth: CGFloat = UIScreen.main.bounds.width
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: containerWidth * 0.91, height: 36.0)
            .background(
                RoundedRectangle(cornerRadius: 6)
                .foregroundColor(configuration.isPressed ? Color.black : Color.cyan)
                .shadow(color: .gray, radius: 1, x: 0, y: 1)
            )
            .foregroundColor(.white)
            .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.bodyFontSize))
            .padding([.bottom, .horizontal])
    }
}

struct TabButtonStyle: ButtonStyle {
    let imageName: String
    let buttonName: String
    let color: Color
    let buttonWidth: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(buttonName)
                .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.tabFontSize))
        }
        .foregroundColor(configuration.isPressed ? color : color)
        .frame(width: buttonWidth, height: 40)
        .padding(.top, 10)
        .padding(.bottom, 5)
        .compositingGroup()
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct SettingsCloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}

struct SettingsButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.subtitleFontSize))
            .padding(.bottom, 5)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}
