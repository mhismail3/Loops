//
//  HomeView.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewViewModel()
    
    let animationDuration: Double = 0.5
    let dampingFraction: Double = 0.5
    let blendDuration: Double = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("My Loops")
                            .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.bodyFontSize))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text(vm.pageTitle)
                                .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.homeTitleFontSize))
                                .foregroundColor(vm.titleForegroundColor)
                                .id(vm.pageTitle)
                                .transition(vm.previousTab <= vm.selectedTab ? .moveAndFade(direction: .right) : .moveAndFade(direction: .left))
                            
                            Spacer()
                            
                            Button(action: { vm.showSettings.toggle() }) {
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .foregroundColor(.black)
                            
                        }
                        .offset(y: -20)
                    }
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                TabBar(selectedTab: $vm.selectedTab, showPopup: $vm.showPopup)
                    .offset(y: vm.tabBarYOffSet)
                    .padding(.bottom, 5)
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            vm.tabBarYOffSet = 0
                        }
                    }
            }
            
            // Tap outside popup to dismiss
            if vm.showPopup {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        vm.showPopup = false
                    }
            }
            
            if vm.showPopup {
                NewItemView()
            }
        }
        .onChange(of: vm.selectedTab) { newValue in
            titleAnimation()
            vm.previousTab = newValue
        }
        .onAppear(perform: titleAnimation)
        .sheet(isPresented: $vm.showSettings) {
            SettingsView(showSettings: $vm.showSettings)
                .presentationDetents([.medium, .large])
        }
    }
    
    private func titleAnimation() {
        withAnimation(.spring(response: animationDuration, dampingFraction: 0.8, blendDuration: blendDuration)) {
            vm.titleForegroundColor = pagePropMap[Pages(rawValue: vm.selectedTab)!]!.titleColor!
        }
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: blendDuration)) {
            vm.pageTitle = pagePropMap[Pages(rawValue: vm.selectedTab)!]!.title
        }
    }
}

enum MoveDirection {
    case left, right
}

#Preview {
    HomeView()
}
