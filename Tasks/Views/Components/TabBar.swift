//
//  TabBar.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import SwiftUI

struct TabBar: View {
    @StateObject var vm = TabBarViewModel()
    
    @Binding var selectedTab: Int {
        didSet {
            updateHighlightPosition()
        }
    }
    @Binding var showPopup: Bool
    
    let animationDuration: Double = 0.3
    let dampingFraction: Double = 0.7
    let blendDuration: Double = 0.0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: vm.firstVStackWidth, height: vm.firstVStackHeight)
                .foregroundColor(Color.white)
                .shadow(radius: 2, x: 0, y: 3)
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 12)
                        .shadow(color: Color.black.opacity(1), radius: 2, x: 2, y: 1)
                    RoundedRectangle(cornerRadius: 12)
                        .shadow(color: Color.black.opacity(1), radius: 2, x: -2, y: 1)
                }
                .frame(width: vm.firstVStackWidth / 5.0, height: vm.firstVStackHeight)
            }
            .opacity(0.14)
            .foregroundColor(vm.highlightColor)
            .offset(x: vm.highlightXOffset)
            
            HStack(spacing: 0) {
                TabButton(imageName: "tray.fill",
                          buttonName: "Inbox",
                          buttonWidth: vm.firstVStackWidth / 5.0) {
                    selectedTab = 0
                }
                
                TabButton(imageName: "bolt.fill", 
                          buttonName: "Today",
                          buttonWidth: vm.firstVStackWidth / 5.0) {
                    selectedTab = 1
                }
                
                TabButton(imageName: "plus.app.fill", 
                          buttonName: "New",
                          color: .cyan,
                          buttonWidth: vm.firstVStackWidth / 5.0) {
                    showPopup = true
                }
                
                TabButton(imageName: "list.bullet.rectangle.fill", 
                          buttonName: "Lists",
                          buttonWidth: vm.firstVStackWidth / 5.0) {
                    selectedTab = 2
                }
                
                TabButton(imageName: "books.vertical.fill", 
                          buttonName: "More",
                          buttonWidth: vm.firstVStackWidth / 5.0) {
                    selectedTab = 3
                }
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        vm.firstVStackHeight = proxy.size.height
                        vm.firstVStackWidth = proxy.size.width
                    }
                }
            )
        }
        .onAppear(perform: {handleOnAppear(animate: false)})
    }
    
    func handleOnAppear(animate: Bool = true) {
        updateHighlightPosition(animate: animate)
    }
    
    func updateHighlightPosition(animate: Bool = true) {
        let tabWidth = vm.firstVStackWidth / 5.0
        let newOffset: CGFloat = (selectedTab < 2) ? CGFloat(selectedTab - 2) * tabWidth : CGFloat(selectedTab - 1) * tabWidth
        
        if animate {
            withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                vm.highlightXOffset = newOffset
                vm.highlightColor = pagePropMap[Pages(rawValue: selectedTab)!]!.color
            }
        } else {
            vm.highlightXOffset = newOffset
            vm.highlightColor = pagePropMap[Pages(rawValue: selectedTab)!]!.color
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    @State static private var selectedTab = 0
    @State static private var showPopup = false

    static var previews: some View {
        VStack {
            Spacer()
            TabBar(selectedTab: $selectedTab, showPopup: $showPopup)
        }
        
    }
}
