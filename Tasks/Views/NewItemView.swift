//
//  NewItemView.swift
//  Tasks
//
//  Created by Moose on 10/20/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var vm = NewItemViewViewModel()
    
    let animationDuration: Double = 0.4
    let dampingFraction: Double = 0.7
    let blendDuration: Double = 0.0
    
    let viewWidth: CGFloat = UIScreen.main.bounds.width * 0.95
    let viewHeight: CGFloat = UIScreen.main.bounds.height * 0.7
    
    var body: some View {
        VStack {
            
            /// Title, subtitle, and logo
            HStack {
                VStack(alignment: .leading) {
                    Text("Add a Loop")
                        .font(.custom(Constants.FontType.titleFontTypeBold,
                              size: Constants.FontSize.sheetTitleFontSize))
                }
                Spacer()
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Text("New Loop")
                        .font(.custom(Constants.FontType.bodyFontType,
                              size: Constants.FontSize.labelFontSize))
                        .opacity(0.5)
                    
                    Spacer()
                    
                }
                TextField("", text: $vm.newLoopText, axis: .vertical)
                    .lineLimit(2, reservesSpace: true)
                    .padding(.all, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .opacity(0.05)
                    )
                    .font(.custom(Constants.FontType.bodyFontType,
                          size: Constants.FontSize.bodyFontSize))
            }
            .padding(.bottom, 10)
            
            VStack {
                HStack {
                    Text("Notes")
                        .font(.custom(Constants.FontType.bodyFontType,
                              size: Constants.FontSize.labelFontSize))
                        .opacity(0.5)
                    
                    Spacer()
                    
                }
                TextField("", text: $vm.notesText, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .padding(.all, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .opacity(0.05)
                    )
                    .font(.custom(Constants.FontType.bodyFontType,
                          size: Constants.FontSize.bodyFontSize))
            }
            .padding(.bottom, 10)
            
            VStack {
                HStack {
                    Text("Date")
                        .font(.custom(Constants.FontType.bodyFontType,
                              size: Constants.FontSize.labelFontSize))
                        .opacity(0.5)
                    
                    Spacer()
                    
                }
                DatePicker("Due Date", selection: $vm.dueDate, displayedComponents: [.date])
                    .font(.custom(Constants.FontType.bodyFontType,
                    size: Constants.FontSize.bodyFontSize))
//                TextField("", text: $vm.notesText, axis: .vertical)
//                    .lineLimit(3, reservesSpace: true)
//                    .padding(.all, 6)
//                    .background(
//                        RoundedRectangle(cornerRadius: 6)
//                            .opacity(0.05)
//                    )
//                    .font(.custom(Constants.FontType.bodyFontType,
//                          size: Constants.FontSize.bodyFontSize))
            }
            .padding(.bottom, 10)
            
            Spacer()
            
            /// Register Button
            Button("Register") {
//                vm.register()
            }
            .buttonStyle(LoginButtonStyle(containerWidth: viewWidth))
        }
        .padding(.all, 14)
        .frame(width: viewWidth, height: viewHeight)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(radius: 5, x: 0, y: 3)
        .offset(y: vm.viewYOffset)
        .opacity(vm.viewOpacity)
        .onAppear {
            withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                vm.viewYOffset = 0
                vm.viewOpacity = 1.0
            }
        }
    }
}

#Preview {
    NewItemView()
}
