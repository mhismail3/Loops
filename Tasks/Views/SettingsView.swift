//
//  SettingsView.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Settings")
                    .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.sheetTitleFontSize))
                Spacer()
                
                Button(action: {
                    showSettings = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .opacity(0.5)
                        .frame(width: 30, height: 30)
                        .symbolRenderingMode(.hierarchical)
                }
                .buttonStyle(SettingsCloseButtonStyle())
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Button("Account") {
                            // Account action
                        }
                        
                        Button("App Preferences") {
                            // Account action
                        }
                        
                        Button("Appearance") {
                            // Account action
                        }
                        
                        Button("Integrations") {
                            // Account action
                        }
                        
                        Button("Help") {
                            // Account action
                        }
                        
                        Button("About") {
                            // Account action
                        }
                    }
                    .buttonStyle(SettingsButtonStyle())
                }
                Spacer()
            }
            .padding(.top)
            
            HStack {
                Text("Loops version 0.10")
                    .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.tabFontSize))
                    .opacity(0.3)
                Spacer()
            }
            .padding(.top, 40)
            
            Spacer()
        }
        .padding(.all, 14)
    }
}


struct SettingsView_Previews: PreviewProvider {
    @State static private var showSettings = true

    static var previews: some View {
        SettingsView(showSettings: $showSettings)
    }
}
