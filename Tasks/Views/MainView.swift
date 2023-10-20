//
//  ContentView.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    
    var body: some View {
        if vm.isSignedIn, !vm.currentUserId.isEmpty {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
