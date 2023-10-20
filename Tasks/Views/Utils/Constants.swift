//
//  Constants.swift
//  Tasks
//
//  Created by Moose on 10/19/23.
//

import SwiftUI
import Foundation

struct Constants {
    struct FontType {
        static let titleFontTypeBold = "Lusitana-Bold"
        static let titleFontTypeRegular = "Lusitana-Regular"
        static let bodyFontType = "Poppins-Medium"
    }
    
    struct FontSize {
        static let titleFontSize: CGFloat = 54
        static let homeTitleFontSize: CGFloat = 48
        static let popupTitleFontSize: CGFloat = 38
        static let sheetTitleFontSize: CGFloat = 32
        static let subtitleFontSize: CGFloat = 20
        static let bodyFontSize: CGFloat = 18
        static let buttonFontSize: CGFloat = 14
        static let labelFontSize: CGFloat = 12
        static let tabFontSize: CGFloat = 11
    }
}

enum Pages: Int {
    case inbox = 0
    case today = 1
    case lists = 2
    case more = 3
}

struct PageProps {
    var color: Color
    var titleColor: Color?
    var title: String
}

let pagePropMap: [Pages: PageProps] = [
    .inbox: PageProps(color: .inboxBlue, 
                      titleColor: .inboxBlue,
                      title: "Inbox"),
    .today: PageProps(color: .todayYellow, 
                      titleColor: .todayYellowTitle,
                      title: "Today"),
    .lists: PageProps(color: .listsPink, 
                      titleColor: .listsPink,
                      title: "Lists"),
    .more: PageProps(color: .gray,
                     titleColor: .black,
                     title: "More"),
]


